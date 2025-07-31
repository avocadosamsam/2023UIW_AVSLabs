function life_lex(arg)
%LIFE_LEX   "Cleve's Laboratory" version of Conway's Game of Life.
%   "Life" is a cellular automaton invented by John Conway that involves
%   life and death in a rectangular, two-dimensional, cellular universe.
%
%   For an introduction see
%       http://en.wikipedia.org/wiki/Conway's_Game_of_Life       
%   This version uses 682 starting populations from the Lexicon originated
%   by Stephen Silver and now maintained by Dave Greene.
%   See:
%       http://conwaylife.com/ref/lexicon/lex_home.htm
%   A text copy of version 29 of the lexicon is in Cleve_Lab/lexicon.txt.
%
%   LIFE_LEX starts with a random population from the lexicon.
%   LIFE_LEX('xyz') starts with the population whose name begins with 'xyz'.
%   LIFE_LEX('slides') is a slide show of all the populations in the lexicon.
%   LIFE_LEX(index) starts with the index-th population from the lexicon.
%   LIFE_LEX(S) ignores the lexicon and starts with the (sparse) matrix S.
%   LIFE_LEX(...,b) includes b border cells around the initial population
%   in the viewing window.  The default is b = 20.
%   Examples:
%      life_lex glider
%      life_lex(163)
%      S = sparse([1 1 1; 1 0 0; 0 1 0]);
%      life_lex(S)
%   all start with a single glider in a 43-by-43 viewing window.
%
%   See:
%      http://www.mathworks.com/moler/exm/chapters/life.pdf
%      http://blogs.mathworks.com/cleve/2018/11/08/revisiting-the-game-of-life

%   Copyright 2014-2018 Cleve Moler
%   Copyright 2014-2018 The MathWorks, Inc.

    if nargin <  1
        arg = 'random';
    end
    
    lex = open_lex('lexicon.txt');
    buttons = initial_buttons;
    pop = population(lex,arg);

    repeat = true;
    while repeat
        
       % Place the initial population in the universe, X.

       [lex,pop] = read_lexicon(lex,pop);
       X = populate(pop);

       plothandle = initial_plot(size(X));
       title(pop.name)

       t = 0;
       loop = true;
       while loop

          % Expand the universe if necessary to avoid the boundary.

          X = expand(X,pop);

          % Update the plot.

          [i,j] = find(X);
          set(plothandle,'xdata',j,'ydata',i);
          caption(t,nnz(X))
          drawnow

          % Whether cells stay alive, die, or generate new cells depends
          % upon how many of their eight possible neighbors are alive.
          % Index vectors increase or decrease the centered index by one.

          n = size(X,1);
          p = [1 1:n-1];
          q = [2:n n];

          % Count how many of the eight neighbors are alive.

          Y = X(:,p) + X(:,q) + X(p,:) + X(q,:) + ...
              X(p,p) + X(q,q) + X(p,q) + X(q,p);

          % A live cell with two live neighbors, or any cell with
          % three live neigbhors, is alive at the next step.

          X = (X & (Y == 2)) | (Y == 3);

          [loop,buttons] = query_buttons(buttons,pop);
          t = t + 1;

       end

       [repeat,pop] = what_next(buttons,lex,pop);
       glider_count(0)

    end
    fclose(lex.fid);
    close(gcf)

    % ------------------------

    function lex = open_lex(filename)
        % lex = file_open(filename)
        %    lex.fid = file identifier
        %    lex.len = number of entries
        %    lex.index = index of current entry

        lex.fid = fopen(filename);
        if lex.fid < 3
           error(['Cannot open "' filename '"'])
        end
        % Count number of usable entries,
        lex.index = 0;
        lex.len = 0;
        while ~feof(lex.fid)
           % Look for a line with two colons, ':name:'.
           line = fgetl(lex.fid);
           if sum(line == ':') >= 2
              % name = line(2:find(line(2:end) == ':',1));
              % Look for an empty line or a line starting with a tab.
              tab = char(9);
              task = [tab '*'];
              tdot = [tab '.'];
              while ~feof(lex.fid)
                 line = fgetl(lex.fid);
                 if isempty(line)
                    break
                 elseif strncmp(line(1:2),task,2) || strncmp(line(1:2),tdot,2)
                    lex.len = lex.len + 1;
                    % fprintf('%d: %s\n',lex.len,name)
                    break
                 end
              end
           end
        end
        frewind(lex.fid);
    end

    % ------------------------

    function pop = population(varargin)
        % pop = population(varargin)
        %    pop.index = index within lexicon of population 
        %    pop.name = name of population
        %    pop.slides = logical flag for slide show of populations
        %    pop.b = border width, default = 20
        %    pop.S = sparse matrix representation of population

        lex = varargin{1};
        pop.index = 0;
        pop.name = ' ';
        pop.slides = false;
        pop.b = 20;
        pop.S = [];
        if ischar(varargin{2}) && isequal(varargin{2},'random')
           pop.index = ceil(rand*lex.len);
        elseif ischar(varargin{2}) && isequal(varargin{2},'slide show')
           pop.slides = true;
           pop.b = 10;
        elseif ischar(varargin{2})
           pop.name = varargin{2};
           pop.index = -1;
        elseif min(size(varargin{2})) > 1
           pop.S = sparse(varargin{2});
           pop.name = sprintf('my %d-by-%d matrix',size(pop.S));
        else
           pop.index = varargin{2};
        end
        if nargin == 3
           pop.b = varargin{3};
        end
    end

    % ------------------------

    function [lex,pop] = read_lexicon(lex,pop)
        % [lex,pop] = read_lexicon(lex,pop)
        %    Update lex and pop to new population

        if pop.slides || pop.index > lex.len
           pop.index = mod(pop.index,lex.len)+1;
        end
        if pop.index < lex.index
           frewind(lex.fid)
           lex.index = 0;
        end
        while lex.index ~= pop.index
           % Look for a line with two colons, ':name:'.
           line = fgetl(lex.fid);
           if sum(line == ':') >= 2
              name = line(2:find(line(2:end) == ':',1));
              % Look for an empty line or a line starting with a tab.
              tab = char(9);
              task = [tab '*'];
              tdot = [tab '.'];
              while ~feof(lex.fid) && lex.index <= lex.len
                 line = fgetl(lex.fid);
                 if isempty(line)
                    break
                 elseif strncmp(line(1:2),task,2) || strncmp(line(1:2),tdot,2)
                    lex.index = lex.index + 1;
                    if lex.index == pop.index || ...
                          strncmpi(name,pop.name,length(pop.name))
                       pop.index = lex.index;
                       if pop.slides
                          pop.name = [name ',  index = ' int2str(pop.index)];
                       else
                          pop.name = name;
                       end
                       % Form sparse matrix by rows from '.' and '*'.
                       S = sparse(0,0);
                       m = 0;
                       while ~isempty(line) && (line(1)==tab)
                          row = sparse(line(2:end) == '*');
                          m = m+1;
                          n = length(row);
                          S(m,n) = 0;
                          S(m,1:n) = row;
                          line = fgetl(lex.fid);
                       end
                       pop.S = S;
                    elseif lex.index == lex.len
                       error('Population name is not in lexicon.')
                    end
                    break
                 end
              end
           end
        end
    end

    % ------------------------

    function buttons = initial_buttons
        % buttons = initial_plot is an array of handles to toggle buttons.

        clf
        shg
        set(gcf,'menubar','none','numbertitle','off','name','life_lex')
        buttons = zeros(9,1);
        bstrings = {'step','slow','fast','previous','redo','next', ...
            'lexicon','blog','stop'};
        for k = 1:9
           pos = [.045+.115*(k-1) .005 .10 .045];
           if k == 9
               pos = [.88 .92 .10 .045];
           end
           buttons(k) = uicontrol('style','toggle','units','normal', ...
               'position',pos,'string',bstrings{k});
        end
        set(buttons(1),'userdata',0);
        
        suggests = { ...
            'random', ...
            'pre-block' ...
            'blinker' ...
            'glider', ...
            'Gosper glider gun', ...
            'Gabriel''s p138', ...
            'Beluchenko''s p37', ...
            'Snark', ...
            'spacefiller', ...
            'Herschel', ...
            'Fx77', ...
            'against the grain', ...
            'soup', ...
            'block and glider', ...
            'lightspeed', ...
            'volatility', ...
            'gliders by the dozen', ...
            'total aperiodic' ....
            'Noah''s ark', ...
            'slide show'};
        
        popupcb = @(a,~) set(a,'userdata',1);
        % Popup always has a nonzero value, so userdata acts like value.
        uicontrol('style','popupmenu','units','normal', ...
            'position',[.87 .50 .12 .05],'tag','suggest', ...
            'callback',popupcb,'string',suggests,'userdata',0);
        
        uicontrol('style','edit','units','normal', ...
            'position',[.87 .60 .12 .05],'tag','editbox', ...
            'callback',popupcb,'string','name/index','userdata',0);
        
        uicontrol('style','text','string','gliders','vis','off', ...
            'units','normal','position',[.02 .50 .15 .05], ...
            'fontname','courier','fontweight','bold','fontsize',12)
        uicontrol('style','text','string',' ','vis','off', ...
            'units','normal','position',[.02 .45 .15 .05], ...
            'fontname','courier','fontweight','bold','fontsize',12, ...
            'tag','gliders')
        glider_count(0)
    end

    % ------------------------

    function plothandle = initial_plot(sizex)
        % plothandle = initial_plot(size(X))
        %    is a handle to customized "spy" plot.

        m = max(sizex);
        ms = max(10-ceil(m/10),2);
        plothandle = plot(0,0,'o', ...
           'markersize',ms,'markerfacecolor','blue');
        set(gca,'xlim',[0.5 m+0.5],'ylim',[0.5 m+0.5],'ydir','rev', ...
           'xtick',[],'ytick',[],'plotboxaspectratio',[m+2 m+2 1])
    end

    % ------------------------

    function X = populate(pop)
        % X = populate(pop);
        %    X = sparse matrix universe with centered initial population

        [p,q] = size(pop.S);
        n = max(p,q) + 2*pop.b;
        X = sparse(n,n);
        i = floor((n-p)/2)+(1:p);
        j = floor((n-q)/2)+(1:q);
        X(i,j) = pop.S;
    end

    % ------------------------

    function X = expand(X,pop)
    % X = expand(X);
        % Expand size if necessary to keep zeros around the boundary. 
        % Border width b avoids doing this every time step.
        n = size(X,1);
        b = max(pop.b,1);
        bi = [];
        g = glider_count;
        if any(any(X(1:3,:)))
            nz = nnz(X(1:7,:));
            if nz < 25 && mod(nz,5) == 0
                g = g + nz/5;
                X(1:7,:) = 0;
            else
                bi = b+(1:n); bj = b/2+(1:n);
            end
        end
        if any(any(X(:,1:3)))
            nz = nnz(X(:,1:7));
            if nz < 25 && mod(nz,5) == 0
                g = g + nz/5;
                X(:,1:7) = 0;
            else
                bi = b/2+(1:n); bj = b+(1:n);
            end
        end
        if any(any(X(n-2:n,:)))
            nz = nnz(X(n-6:n,:));
            if nz < 25 && mod(nz,5) == 0
                g = g + nz/5;
                X(n-6:n,:) = 0;
            else
                bi = 1:n; bj = b/2+(1:n);
            end
        end
        if any(any(X(:,n-2:n)))
            nz = nnz(X(:,n-6:n));
            if nz < 25 && mod(nz,5) == 0
                g = g + nz/5;
                X(:,n-6:n) = 0;
            else
                bi = b/2+(1:n); bj = 1:n;
            end
        end
        if ~isempty(bi)
            T = X;
            X = sparse(n+b,n+b);
            X(bi,bj) = T;
            n = n+b;
            set(gca,'xlim',get(gca,'xlim')+[0 b])
            set(gca,'ylim',get(gca,'ylim')+[0 b])
        end
        glider_count(g)
    end

    % ------------------------

    function [loop,buttons] = query_buttons(buttons,pop)
    % [loop,buttons] = query_buttons(buttons);
    %    loop = true: continue time stepping
    %    loop = false: restart

        if pop.slides
           pause(1)
           loop = false;
        else
           bv = cell2mat(get(buttons,'value'));
           bk = get(buttons(1),'userdata');
           editbox = findobj('tag','editbox');
           bv(end+1) = get(editbox,'userdata');
           suggest = findobj('tag','suggest');
           bv(end+1) = get(suggest,'userdata');
           if bk == 0 || sum(bv==1) ~= 1
              while all(bv == 0)
                 drawnow
                 bv = cell2mat(get(buttons,'value'));
                 bv(end+1) = get(editbox,'userdata');
                 bv(end+1) = get(suggest,'userdata');
              end
              if sum(bv==1) > 1
                 bv(bk) = 0;
              end
              bk = find(bv == 1);
           end
           idx = 1:9;
           if bk < 10
               idx(bk) = [];
           end
           set(buttons(idx),'value',0)
           if bk ~= 10 
               set(editbox,'userdata',0)
           end
           if bk ~= 11
               set(suggest,'userdata',0)
           end
           switch bk
              case 1  % step
                 set(buttons(1),'value',0);
                 bk = 0;
                 loop = true;
              case 2  % slow
                 pause(.5)
                 loop = true;
              case 3  % fast
                 pause(.01)
                 loop = true;
              otherwise
                 loop = false;
           end
           % Remember button number
           set(buttons(1),'userdata',bk);
           if bk ~= 9
               set(buttons(9),'string','stop')
           end
        end
    end

    % ------------------------

    function [repeat,pop] = what_next(buttons,lex,pop)
        % [next,pop] = what_next(buttons,lex,pop);
        %    repeat = true: start with a new population
        %    repeat = false: exit

        bv = cell2mat(get(buttons,'value'));
        editbox = findobj('tag','editbox');
        bv(end+1) = get(editbox,'userdata');
        suggest = findobj('tag','suggest');
        bv(end+1) = get(suggest,'userdata');
        bk = find(bv == 1);
        set(buttons,'value',0)
        set(suggest,'userdata',0)
        repeat = true;
        if ~isempty(bk)
           switch bk
              case 4  % previous
                 pop.index = max(1,lex.index-1);
              case 5  % redo
                 pop.index = lex.index;
              case 6  % next
                 pop.index = mod(lex.index,lex.len)+1;
              case 7  % lexicon
                 web('http://conwaylife.com/ref/lexicon/lex.htm')
              case 8  % blog
                 web('https://blogs.mathworks.com/cleve/2018/11/08/revisiting-the-game-of-life')
              case 9  % stop/close
                 repeat = isequal(get(buttons(9),'string'),'stop');
                 if repeat
                     set(buttons(9),'string','close')
                 else
                     set(buttons(9),'string','stop')
                 end
               case 10 % edit box
                   % name or index
                   s = get(editbox,'string');
                   d = str2double(s);
                   if ~isnan(d)
                       s = d;
                   end
                   pop = population(lex,s);
                   set(editbox,'userdata',0)
               case 11 % suggest
                   v = get(suggest,'value');
                   s = get(suggest,'string');
                   pop = population(lex,s{v});
           end
           if bk ~= 9
               set(buttons(9),'string','stop')
           end

        end
    end
    
    % --------------
    
    function c = glider_count(g)
        % glider_count(g) sets glider count to g,
        % c = glider_count returns glider count.
        % c = glider_count(g) does both.
        gob = findobj('tag','gliders');
        if nargin > 0
            set(gob,'string',int2str(g))
            if g == 0
                set(findobj('string','gliders'),'vis','off')
                set(gob,'vis','off')
            else
                set(findobj('string','gliders'),'vis','on')
                set(gob,'vis','on')
            end
        end
        if nargout > 0
            c = str2double(get(gob,'string'));
        end
    end
    
    % --------------
    
    function caption(t,nnz)
        % caption(t,nnz(X))
        % Print time step count and population size on the x-label.
        nnzp5g = nnz + 5*glider_count;
        s = sprintf('t = %3d, pop = %3d',t,nnzp5g);
        fs = get(0,'defaulttextfontsize')+2;
        xlabel(s,'fontname','courier','fontsize',fs,'fontweight','bold');
        %disp([t nnzp5g])
    end

end % life_lex
