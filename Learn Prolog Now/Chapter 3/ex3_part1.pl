% Exercise 3.1

% Define a predicate in/2 , that tells us which doll is 
% (directly or indirectly) contained in which other doll.
% E.g. the query in(katarina,natasha) should evaluate to
% true, while in(olga, katarina) should fail.

inside(katarina,olga).
inside(olga,natsha).
inside(natsha,irina).

in(X,Y):-inside(X,Y),!.
in(X,Y):-inside(Z,Y),in(X,Z),!.

% The key point here is to have a recursive program that
% would detect when we have a doll inside another even if 
% the direct inclusion is not made explicit. This is 
% accomplished by observing the transitivity of the 
% "inside" relationship between distinct dolls: if 
% doll Z is inside doll Y and doll Y is inside doll X
% then it must be the case that doll X contains Z as well.