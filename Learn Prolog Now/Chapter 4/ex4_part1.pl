% Exercise 4.1 

% How does Prolog respond to the following queries?
% 1. [a,b,c,d] = [a,[b,c,d]].
% This evaluates to false as the second element of
% the list of the left is c while the second element
% of the list on the right hand side of the equal sign
% is a nother list, namely [b,c,d]. 

% 2. [a,b,c,d] = [a|[b,c,d]].
% This is evaluated to true because the list on the right
% hand side is obtained by merging the head of the list,a,
% with the list [b,c,d] giving exactly [a,b,c,d].

% 3. [a,b,c,d] = [a,b,[c,d]].
% This is evaluated to false for a similar reason as in 1.

% 4. [a,b,c,d] = [a,b|[c,d]].
% This is evaluated to true for the same reason as in 2.

% 5. [a,b,c,d] = [a,b,c,[d]].
% This is evaluated to false for the same reason as in 1.

% 6. [a,b,c,d] = [a,b,c|[d]].
% This is evaluated to true for the same reason as in 2.

% 7. [a,b,c,d] = [a,b,c,d,[]].
% This is evaluated to false because the left list has
% only 4 elements, while the right one has 5 elements.

% 8. [a,b,c,d] = [a,b,c,d|[]].
% This is evaluated to true as we can obtain [a,b,c,d]
% by appending the head H = [a,b,c,d] to the empty list.

% 9. [] = _.
% This is evaluated to true because the anonymous
% variable can be matched to the empty list.

% 10. [] = [_].
% This is evaluated to false because a list with no 
% elements cannot be matched against a list with one element.

% 11. [] = [_|[]].
% This is evaluated to false for the same reason as in 10.