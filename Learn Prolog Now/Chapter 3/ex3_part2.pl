% Exercise 3.2

% Define a predicate greater_than/2 that takes two 
% numerals in the notation that we introduced in this 
% lecture (i.e. 0, succ(0), succ(succ(0)) ...) as 
% arguments and decides whether the first one is greater
% than the second one.

greater_than(0,0):-!,fail.
greater_than(_,0).
greater_than(succ(X),succ(Y)):-greater_than(X,Y),!.

% We need the extra predicate greater_than(0,0) because
% we need to find the numbers X greater than a number Y,
% and not a number X which is greater than or equal to 
% Y. That is why greater_than(0,0) needs to fail.