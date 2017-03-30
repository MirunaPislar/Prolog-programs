% Exercise 6.1 

% Let’s call a list doubled if it is made of two 
% consecutive blocks of elements that are exactly the
% same. For example, [a,b,c,a,b,c] is doubled (it’s made
% up of [a,b,c] followed by [a,b,c]) and so is
% [foo,gubble,foo,gubble]. On the other hand,
% [foo,gubble,foo] is not doubled. Write a predicate
% doubled(List) which succeeds when List is a doubled list.

doubled(Whole) :- append(Half, Half, Whole).

% This condition is checked by trying to match the list 
% obtained by appending the two halves of the whole list
% to the original list, named here Whole.