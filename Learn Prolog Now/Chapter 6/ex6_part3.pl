% Exercise 6.3

% 1. Write a predicate second(X,List) which checks
% whether X is the second element of List.

second(X,[_,X|_]).

% 2. Write a predicate swap12(List1,List2) which checks 
% whether List1 is identical to List2 , except that the
% first two elements are exchanged.

swap12([],[]).
swap12([E1,E2|List],[E2, E1|List]). 

% 3. Write a predicate final(X,List) which checks whether
% X is the last element of List.

% Calculate the reverse of a list
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).
rev(L,R) :- accRev(L,[],R).

% Check the last element as the first element of the
% reversed list 
final(X,List):-rev(List,[X|_]).

% 4. Write a predicate toptail(InList,Outlist) which says
% ‘no’ if inlist is a list containing fewer than 2
% elements, and which deletes the first and the last
% elements of Inlist and returns the result as Outlist,
% when Inlist is a list containing at least 2 elements.
% For example:

% toptail([a],T).
% no

% toptail([a,b],T).
% T=[]

% toptail([a,b,c],T).
% T=[b]

toptail([],_):-!,fail.
toptail([_|[]],_):-!,fail.
toptail([_|InList],Outlist):-
rev(InList, [_|OutlistRev]),
rev(OutlistRev,Outlist).

% 5. Write a predicate swapfl(List1,List2) which checks
% whether List1 is identical to List2 , except that the
% first and last elements are exchanged.

swapfl([X|List1],[Y|List2]):-
rev(List1,[Y|RevList1]),
rev(List2,[X|RevList2]),
RevList1 == RevList2.