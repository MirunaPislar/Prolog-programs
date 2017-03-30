% Exercise 6.2 

% A palindrome is a word or phrase that spells the same
% forwards and backwards. For example, ‘rotator’, ‘eve’,
% and ‘nurses run’ are all palindromes. Write a predicate
% palindrome(List) , which checks whether List is a
% palindrome. For example, to the queries
% ?- palindrome([r,o,t,a,t,o,r]).
% and
% ?- palindrome([n,u,r,s,e,s,r,u,n]).
% Prolog should respond ‘yes’, but to the query
% ?- palindrome([n,o,t,h,i,s]).
% Prolog should respond ‘no’.

accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).
rev(L,R) :- accRev(L,[],R).

palindrome(List):-rev(List,RevList), RevList == List.

% A palindrome list should have its reverse list equal to itself.