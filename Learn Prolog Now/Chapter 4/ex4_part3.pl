% Exercise 4.3 

% Write a predicate twice(In,Out) whose left argument is
% a list, and whose right argument is a list consisting
% of every element in the left list written twice.

% For example, the query
%
% twice([a,4,buggle],X).
%
% should return
%
% X = [a,a,4,4,buggle,buggle]).
%
% And the query
%
% twice([1,2,1,1],X).
%
% should return
%
% X = [1,1,2,2,1,1,1,1].

twice([],[]).
twice([H|T1],[H,H|T2]) :- twice(T1,T2).