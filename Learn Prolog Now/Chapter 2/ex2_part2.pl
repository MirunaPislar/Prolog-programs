% Exercise 2.2

% We are working with the following knowledge base:

house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):-house_elf(X).
magic(X):-wizard(X).
magic(X):-witch(X).

% Which of the following queries are satisfied? 
% Where relevant, give all the variable
% instantiations that lead to success.

% 1. magic(house_elf).
% Not satisfied as there is no possibility of matching 
% magic(house_elf) with any of its definitions.

% 2. wizard(harry).
% Not satisfied. What wizard?!

% 3. magic(wizard).
% Not satisfied. Again, what wizard?!

% 4. magic('McGonagall').
% This is satisfied as wizard('McGonagall'). is valid.

% 5. magic(Hermione).
% Pay attention: here Hermione is a variable, therefore
% different from hermione (which is a constant).
% Because of this variable, the query can be satisfied.
% So Hermione can be instantiated to any of the 4 atoms.
% Hermione = dobby;
% Hermione = hermione;
% Hermione = 'McGonagall';
% Hermione = rita_skeeter.