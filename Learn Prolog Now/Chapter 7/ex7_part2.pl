% Exercise 7.2

% The formal language a^n b^n - {E} consists of all 
% the strings in a^n b^n except the empty string. 
% Write a DCG that generates this language.

rule-->a,b.
rule-->a,rule,b.
a-->[a].
b-->[b].