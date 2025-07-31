function [result] = is_vowel(str)
lower=(str>'`'&str<'b')|(str>'d'&str<'f')|(str>'h'&str<'j')|(str>'m'&str<'p')|(str>'t'&str<'v');
upper=(str>'@'&str<'B')|(str>'D'&str<'F')|(str>'H'&str<'J')|(str>'M'&str<'P')|(str>'T'&str<'V');
result=lower+upper;
end