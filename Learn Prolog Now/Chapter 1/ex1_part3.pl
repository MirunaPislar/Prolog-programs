% Exercise 1.3

% How many facts, rules, clauses, and predicates 
% are there in the following knowledge base? 
% What are the heads of the rules, and what are 
% the goals they contain?

% First, a reminder that a collection of facts and rules
% is called a knowledge base (or a database).

% woman(vincent). - this is a fact
% 
% woman(mia). - this is a fact
% 
% man(jules). - this is a fact
% 
% person(X) :- man(X); woman(X). % this is a rule since it
% states some things which are conditionally true 
% of the domain of interest.
% 
% loves(X,Y) :- knows(Y,X). % this is a rule
% 
% father(Y,Z) :- man(Y), son(Z,Y). % this is a rule
% 
% father(Y,Z) :- man(Y), daughter(Z,Y). - this is a rule

% Everything that is on the left hand side of the :- 
% is the head of the rule, and everything that is 
% on the right hand side of the :- is the body of the rule 
% (the body contains the goals of the rule).

% The facts and rules contained in a knowledge base 
% are called clauses. So there are 7 clauses.

% The predicates are: woman, man, person, loves, father 
% and daughter - so there are 7 predicates.