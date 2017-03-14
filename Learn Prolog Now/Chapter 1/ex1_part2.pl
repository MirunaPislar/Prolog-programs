% Exercise 1.2

% Which of the following sequences of characters are atoms, 
% which are variables, which are complex terms, and 
% which are not terms at all? 
% Give the functor and arity of each complex term.

% 1. loves(Vincent,mia) - this is a complex term of arity 2, loves is the functor, Vincent is a variable, mia is an atom
%
% 2. ’loves(Vincent,mia)’ - this is an atom (because of the quotes)
%
% 3. Butch(boxer) - not a term at all because Butch is a variable and variables cannot be functors
%
% 4. boxer(Butch) - this is a complex term of arity 1, the functor is boxer, the variable is Butch
%
% 5. and(big(burger),kahuna(burger)) - this is a (nested) complex term of arity 2, the functor being 'and'. It is nested because its arguments are also complex terms of arity 1
%
% 6. and(big(X),kahuna(X)) - this is a complex term of arity 2, 'and' is also the functor
%
% 7. _and(big(X),kahuna(X)) - this is not a term because of the use fo brackets inside variable name
%
% 8. (Butch kills Vincent) - this is not a term because of the wrong order of both terms and brackets
% 
% 9. kills(Butch Vincent) - this is not a term because of the missing comma between variables (and we cannot treat Butch Vincent as a single variable since there is an empty space in between them)
% 
% 10. kills(Butch,Vincent - this is not a term because of the missing closing bracket