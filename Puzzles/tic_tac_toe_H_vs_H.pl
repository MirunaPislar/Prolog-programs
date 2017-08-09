% The tic-tac-toe game, played user against another user.
% A 3 x 3 grid is printed. The choice of th next move is made by
% typing an index from 1 to 9, the grid is printed like this.
% |1|2|3|
% |4|5|6|
% |7|8|9|
% Note: because this is Prolog, you have to also type '.' after the
% index you selected. (example: 2.)

% Use the : infix operator to separate x/O from their grid position.
:-op(300, xfx, :). 

% Print the grid
printGrid([]):- !.
printGrid([E1,E2,E3|Grid]) :- 
		printRow([E1, E2, E3]),printGrid(Grid).

% Print just a row		
printRow([_:X, _:Y, _:Z]) :- write('|'),
		printChar(X), write('|'),
		printChar(Y), write('|'),
		printChar(Z), write('|'), nl.
		
% Print a character
printChar(X) :- atom(X), write(X),!.
printChar(Y) :- write(Y), !.

% Play the game
play :- Grid = [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9],
		write('Welcome! This is your board.'), nl,
		printGrid(Grid),
		write('Type an index from 1 to 9 to select your next move.'), nl,
		move(Grid, x).

% Make a move
move(Grid, x) :- notFull(Grid), nl, write('X\'s Turn. '), 
		turn(Grid, NewGrid, x),
		printGrid(NewGrid),
		(win(NewGrid, x) -> write('X won!'); move(NewGrid, 'O')).
		
move(Grid, 'O') :- notFull(Grid), nl, write('O\'s Turn. '),
		turn(Grid, NewGrid, 'O'),
		printGrid(NewGrid),
		(win(NewGrid, 'O') -> write('O won!'); move(NewGrid, x)).
		
% Make sure the grid is not full
notFull([]) :- false.
notFull([_:H|_]) :- not(atom(H)), !.
notFull([_:H|T]) :- atom(H), notFull(T),!.

% Define a turn - A can be either X or O
turn(Grid, NewGrid, A) :- readInput(Pos), 
		(empty(Pos, Grid) -> add(Grid, Pos, A, NewGrid);
		turn(Grid, NewGrid, A)).

% Check whether a position is empty.
empty(Pos, [Pos:A|_]) :- not(atom(A)), !.
empty(Pos, [Pos:_|_]) :- 
		write('Position already occupied. Try again.'), nl, !, fail.
empty(Pos, [_:_|T]) :- empty(Pos, T), !.
		
% Horizontal options to win the game.
win([1:A, 2:A, 3:A, 4:_, 5:_, 6:_, 7:_, 8:_, 9:_], A).
win([1:_, 2:_, 3:_, 4:A, 5:A, 6:A, 7:_, 8:_, 9:_], A).
win([1:_, 2:_, 3:_, 4:_, 5:_, 6:_, 7:A, 8:A, 9:A], A).

% Vertical options to win the game.
win([1:A, 2:_, 3:_, 4:A, 5:_, 6:_, 7:A, 8:_, 9:_], A).
win([1:_, 2:A, 3:_, 4:_, 5:A, 6:_, 7:_, 8:A, 9:_], A).
win([1:_, 2:_, 3:A, 4:_, 5:_, 6:A, 7:_, 8:_, 9:A], A).

% Diagonal options to win the game.
win([1:A, 2:_, 3:_, 4:_, 5:A, 6:_, 7:_, 8:_, 9:A], A).
win([1:_, 2:_, 3:A, 4:_, 5:A, 6:_, 7:A, 8:_, 9:_], A).
	
% Add a move to the grid - either x or O - specified by A
add(Grid, Pos, A, NewGrid) :- split(Grid, Pos, L1, L2),
		append(L1, [Pos:A|L2], NewGrid), !.

% Split a Grid into two parts; the length of the first part is given.
split(Grid, N, L1, L2) :- split(Grid, N, 1, [], L1, L2), !.
split([_|T], N, N, Acc, Acc, T).
split([H|T], N, K, Acc, L1, L2) :- K1 is K + 1,
		append(Acc, [H], AccNew),
		split(T, N, K1, AccNew, L1, L2).

% Methods that handle user input.
readInput(X) :- write('Write the index of your next move: '), nl,
		read(X).
