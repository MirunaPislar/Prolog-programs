% This Sudoku Solution does not use any fast built-in predicates
% It is meant to solve logically, step-by-step, the sudoku puzzle
% until a feasible solution is found. Therefore, it is pretty slow
% for large inputs. Up until test6 it runs pretty fast. But it takes
% a couple of hours to solve the 9x9 riddle.

% Solve the N x N sudoku puzzle by instantiating rows and check 
% whether the columns are also distinct.
sudoku(List, N) :- bagof(X, between(1, N, X), Range),
		solveRows(List, Range), 
		N1 is N + 1, checkCol(List, 1, N1).

% Solve all rows.
solveRows([], _).
solveRows([H|T], Range):- row(H, Range), 
		check_distinct(H), solveRows(T, Range).

% Find a value for each entry on each row.
row([],  _).
row([H|T], Range) :- member(H, Range), row(T, Range).

% Check whether the columns are distinct as well.
checkCol(_, N, N) :- !.
checkCol(List, N, K) :- get_elements(List, N, Add),
		check_distinct(Add), N1 is N + 1, checkCol(List, N1, K).

% Get all elements at position N from a list of lists.
get_elements([], _, []).
get_elements([H|T], N, [X|Add]) :- element_at(X, H, N), 
		get_elements(T, N, Add).

% Get the element at position K in a list.
element_at(X, [X|_], 1) :- !.
element_at(X, [_|L], K) :- K1 is K - 1, element_at(X, L, K1), !.

% Check if a list constains only distinct elements
check_distinct([]).
check_distinct([H|T]) :- not(member(H,T)), check_distinct(T), !.
check_distinct([H|T]) :- member(H,T), false, !.

% Print a solution
printFunc([]).
printFunc([H|T]) :- write(H), nl, printFunc(T).

% Different tests, varying on size N of the puzzle
test3 :- List = [[1,_,_],[2,_,1],[_,_,2]],
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).

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
		
test7 :- List = [
		[7,_,6,_,_,_,_],
		[5,_,_,_,_,4,1],
		[_,1,_,2,_,_,_],
		[_,4,_,_,_,_,_],
		[_,6,3,_,_,_,_],
		[_,_,_,7,_,_,_],
		[_,_,1,_,_,_,3]], 
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).
		
test8 :- List = [
		[3,_,6,_,_,_,_,8],
		[6,_,_,_,_,1,_,_],
		[_,6,_,2,_,_,_,_],
		[_,_,_,1,_,_,5,_],
		[_,_,3,_,_,_,_,_],
		[_,_,_,7,_,_,_,_],
		[8,_,_,_,_,_,3,_],
		[_,7,1,_,_,_,4,2]], 
		length(List, Length), 
		sudoku(List, Length),
		printFunc(List).
		
test9_1 :- List = [  
   [8,_,_,_,_,_,_,_,_],  
   [_,_,3,6,_,_,_,_,_],  
   [_,7,_,_,9,_,2,_,_],  
   [_,5,_,_,_,7,_,_,_],  
   [_,_,_,_,4,5,7,_,_],  
   [_,_,_,1,_,_,_,3,_],  
   [_,_,1,_,_,_,_,6,8],  
   [_,_,8,5,_,_,_,1,_],  
   [_,9,_,_,_,_,4,_,_]], 
   length(List, Length), 
   sudoku(List, Length),
   printFunc(List).
		
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
