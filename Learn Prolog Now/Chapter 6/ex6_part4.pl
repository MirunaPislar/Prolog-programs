% Exercise 6.4 

% And here is an exercise for those of you who, like me,
% like logic puzzles. There is a street with three
% neighboring houses that all have a different color.
% They are red, blue, and green. People of different
% nationalities live in the different houses and
% they all have a different pet. Here are some more facts
% about them:

% The Englishman lives in the red house.
% The jaguar is the pet of the Spanish family.
% The Japanese lives to the right of the snail keeper.
% The snail keeper lives to the left of the blue house.

% Who keeps the zebra?
% Define a predicate zebra/1 that tells you the
% nationality of the owner of the zebra.
% Hint: Think of a representation for the houses and 
% the street. Code the four constraints in Prolog. 
% member and sublist might be useful predicates.

prefix(Prefix,List) :- append(Prefix,_,List).
suffix(Suffix,List) :- append(_,Suffix,List).
sublist(SubList,List) :- 
suffix(Suffix,List), 
prefix(SubList,Suffix).

zebra(ZebraOwner):- 
Houses = [_,_,_],
member(house(red,english,_),Houses),
member(house(_,spanish,jaguar),Houses),
member(house(_,japanese,_),Houses),
member(house(_,ZebraOwner,zebra),Houses),
member(house(green,_,_),Houses),
sublist([house(_, _, snail), house(blue, _, _)], Houses),
sublist([house(_,_,snail), house(_,japanese,_)], Houses),!.

% The two solutions obtained for the positions of the houses are:

% 1. house(red, english, snail), house(blue, japanese, zebra), house(green, spanish, jaguar)
% 2. house(green, spanish, jaguar), house(red, english, snail), house(blue, japanese, zebra)

% But for both of them, the zebra keepers are the Japanese people

