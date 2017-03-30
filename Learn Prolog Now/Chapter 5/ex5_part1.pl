% Exercise 5.1 

% How does Prolog respond to the following queries?
% 1. X = 3*4.
% Response: X = 3*4. because the = operator is for unification

% 2. X is 3*4.
% Response: X = 12. because the is functor
% is used to perform arithmetic operations

% 3. 4 is X.
% Response: ERROR because the variable cannot be on the left hand side.

% 4. X = Y.
% Response: X = Y.

% 5. 3 is 1+2.
% Response: true because the left hand side evaluates to 3
% which matches the three on the right hand side

% 6. 3 is +(1,2).
% Response: true

% 7. 3 is X+2.
% Response: ERROR, same reason as in 3.

% 8. X is 1+2.
% Response: X = 3.

% 9. 1+2 is 1+2.
% Response: false because the left hand side evaluates
% to 3, which cannot be matched against 1+2

% 10. is(X,+(1,2)).
% Response: X = 3. because this is just like X is 1 + 2

% 11. 3+2 = +(3,2).
% Response: true. because +(3,2) is just like 3+2

% 12. *(7,5) = 7*5.
% Response: X = true.

% 13. *(7,+(3,2)) = 7*(3+2).
% Response: X = true.

% 14. *(7,(3+2)) = 7*(3+2).
% Response: X = true.

% 15. *(7,(3+2)) = 7*(+(3,2)).
% Response: X = true.