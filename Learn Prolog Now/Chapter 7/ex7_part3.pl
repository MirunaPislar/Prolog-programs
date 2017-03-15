% Exercise 7.3

% Let a^n b^(2n) be the formal language which contains 
% all strings of the form: an unbroken block of as of 
% length n followed by an unbroken block of bs of length 2n,
% and nothing else. (but includes the empty string) 
% Write a DCG that generates this language.

rule-->[].
rule-->a,rule,b,b.
a-->[a].
b-->[b].