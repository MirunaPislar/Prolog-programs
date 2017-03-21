% Exercise 2.1

% First, a bit of theory
% When do two terms match?
% Two terms match if they are equal or if they contain
% variables that can be instantiated in such a way that
% the resulting terms are equal.
% The =/2 predicate tests whether two arguments match.

% Which of the following pairs of terms match? 
% Where relevant, give the variable instantiations 
% that lead to successful matching.

% 1. bread = bread
% This is a match because the two terms (which are  
% constants) represent the same atom.

% 2. ’Bread’ = bread
% This is not a match beacuse the two constants do not
% represent the same atom.

% 3. ’bread’ = bread
% This is a match for the same reason as in 1.

% 4. Bread = bread
% This is a match because Bread is a variable that can be
% instantiated to term bread (Bread = bread).

% 5. bread = sausage
% This is not a match beacuse the two atoms are not the same.

% 6. food(bread) = bread
% This is not a match because an atom (constant) is not
% the same as the complex function food(bread).

% 7. food(bread) = X
% This is a match because variable X can be instantiated
% to the complex term X = food(bread).

% 8. food(X) = food(bread)
% This is a match, X = bread.

% 9. food(bread,X) = food(Y,sausage)
% This is a match, X = sausage and Y = bread.

% 10. food(bread,X,beer) = food(Y,sausage,X)
% This is not a match since X cannot be instantiated to 
% both X = sausage and X = beer. 

% 11. food(bread,X,beer) = food(Y,kahuna_burger)
% This is not a match because the two definitions of the
% complex terms have different arities.

% 12. food(X) = X
% This is a match, X = food(X), because 
% food(food(food(...))) matches food(food(food(...))).

% 13. meal(food(bread),drink(beer)) = meal(X,Y)
% This is a match, X = food(bread) and Y = drink(beer).

% 14. meal(food(bread),X) = meal(X,drink(beer))
% This is not a match because X cannot be simultaneously
% instantiated to X = food(bread) and X = drink(beer).