% This Sudoku Solution uses some efficient predicates defined in the 
% CLP(FD) library - Constraint Logic Programming over Finite Domains
% but these are adapted on the intitial brute-force solution that
% does not use this library. The tests remained the same.

% By using this library we achieve faster solutions
:- use_module(library(clpfd)).

% Solve the N x N sudoku puzzle by instantiating rows and check 
% whether the columns match the requirements. 
% If a solution is found, it is printed row by row on the screen.
sudoku(Rows, N) :- bagof(X, between(1, N, X), Range),
		solveRows(Rows, Range), 
		transpose(Rows, Cols), 
		maplist(all_distinct, Cols).

% Solve all rows - each row is a permutation in range [1,N]
% so there is no need to check if rows are distinct
solveRows([], _).
solveRows([H|T], Range):- permutation(H, Range),
		solveRows(T, Range).

% Print a solution
printFunc([]).
printFunc([H|T]) :- write(H), nl, printFunc(T).

% Different tests, varying on size N of the puzzle 
test3 :- List = [[1,_,_],[2,_,1],[_,_,2]],
		length(List, Length), 
		sudoku(List, Length),printFunc(List).

test4 :- List = [[4,_,3,_],[1,_,_,_],[_,1,_,2],[_,4,_,_]], 
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).
 		
test5 :- List = [
		[5,_,3,_,_],
		[4,_,_,3,_],
		[_,1,_,2,_],
		[_,4,_,_,_],
		[1,_,_,_,4]],
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).
 		
test6 :- List = [
		[1,_,3,_,_,6],
		[4,_,_,_,_,1],
		[_,1,_,2,_,_],
		[_,4,_,_,_,_],
		[_,5,_,_,_,_],
		[_,_,_,6,_,_]], 
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).
 		
test9_1 :- Puzzle = [  
   [8,_,_,_,_,_,_,_,_],  
   [_,_,3,6,_,_,_,_,_],  
   [_,7,_,_,9,_,2,_,_],  
   [_,5,_,_,_,7,_,_,_],  
   [_,_,_,_,4,5,7,_,_],  
   [_,_,_,1,_,_,_,3,_],  
   [_,_,1,_,_,_,_,6,8],  
   [_,_,8,5,_,_,_,1,_],  
   [_,9,_,_,_,_,4,_,_]], 
   length(Puzzle, Length), 
   sudoku(Puzzle, Length),
   printFunc(Puzzle).
		
test9_2 :- List = [
		[4,8,5,9,_,_,_,_,_],
		[_,1,9,_,_,_,6,_,_],
		[6,7,_,4,_,3,1,_,_],
		[_,2,_,6,3,_,8,_,_],
		[_,_,3,_,9,_,7,_,_],
		[_,_,4,_,1,7,_,2,_],
		[_,_,6,8,_,2,_,1,9],
		[_,_,1,_,_,_,5,8,_],
		[_,_,_,_,_,9,3,7,6]],
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).
