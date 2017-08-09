% This is the tic-tac-toe game
% A 3 x 3 grid is printed, the users can choose
% how how they want to play: against another person (option 1)
% or against the computer (option 2). The choice of th next move is
% made by typing an index from 1 to 9, the grid is printed like this.
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
play :- write('Welcome to the Tic-Tac-Toe Game!'),nl,
		write('Select the mode in which you\'d like to play:'), nl,
		write('Type 1 - if you want to play Human vs. Human'),nl,
		write('Type 2 - if you want to play Human vs. Computer'),nl,
		readOption(Type), makeChoice(Type).

readOption(Type) :- write('Enter your option here: '), nl,
		read(Type).
		
makeChoice(1) :- human_vs_human.
makeChoice(2) :- human_vs_computer.

% ------------------------------------		
% Play in mode Human vs. Human
% ------------------------------------
human_vs_human :- 
		Grid = [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9],
		write('This is your board.'), nl,
		printGrid(Grid), 
		write('Type an index from 1 to 9 to select your next move.'),
		nl, move(Grid, x).

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
		
% ------------------------------------		
% Play in mode Human vs. Computer
% ------------------------------------
human_vs_computer :- 
		Grid = [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9],
		write('This is your board.'), nl,
		printGrid(Grid),
		write('Type an index from 1 to 9 to select your next move.'),
		nl, human(Grid). % Always human starts first

% Make a move - either human or computer.
human(Grid) :- notFull(Grid), nl, write('Your turn. '), 
		human_turn(Grid, NewGrid, x),
		printGrid(NewGrid),
		(win(NewGrid, x) -> write('You won!'); computer(NewGrid)),!.
		
computer(Grid) :- notFull(Grid), nl, write('Computer\'s turn. '),
		nl, computer_turn(Grid, NewGrid, 'O'),
		printGrid(NewGrid),
		(win(NewGrid, 'O') -> write('Computer won!'); human(NewGrid)),!.

computer(Grid) :- not(notFull(Grid)), write('It\'s a draw!'), nl, !.

% Define a Human turn - A can be just x
human_turn(Grid, NewGrid, A) :- readInput(Pos), 
		(empty(Pos, Grid) -> add(Grid, Pos, A, NewGrid);
		human_turn(Grid, NewGrid, A)).
		
% Define a computer turn.
computer_turn(Grid, NewGrid, A) :- obtain_position(Grid, Pos),
		add(Grid, Pos, A, NewGrid).
		
obtain_position(Grid, Pos) :- try_to_win(Grid, 1, Pos).
obtain_position(Grid, Pos) :- defend(Grid, 1, Pos).
obtain_position(Grid, Pos) :- twoZeros(Grid, 1, Pos).
obtain_position(Grid, Pos) :- random_pos(Grid, Pos).

% Computer tries to make a winning move		
try_to_win(Grid, Pos, Pos) :- empty_place(Pos, Grid), 
		add(Grid, Pos, 'O', NewGrid), win(NewGrid, 'O').
try_to_win(Grid, Current, Pos) :- Next is Current + 1,
		(Next =< 9 -> try_to_win(Grid, Next, Pos) ; fail). 
		
% In case human is in a winning position, computer defends himself
defend(Grid, Pos, Pos) :- empty_place(Pos, Grid), 
		add(Grid, Pos, x, NewGrid), win(NewGrid, x).
defend(Grid, Current, Pos) :- Next is Current + 1,
		(Next =< 9 -> defend(Grid, Next, Pos) ; fail). 
		
% Try having two consecutive zeros

% Try the positon on same row, next column
twoZeros(Grid, Current, Pos) :- Pos is Current + 1, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on same row, previous column
twoZeros(Grid, Current, Pos) :- Pos is Current - 1, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on previous row, previous column
twoZeros(Grid, Current, Pos) :- Pos is Current - 4, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on previous row, same column
twoZeros(Grid, Current, Pos) :- Pos is Current - 3, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on previous row, previous column
twoZeros(Grid, Current, Pos) :- Pos is Current - 2, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on next row, previous column
twoZeros(Grid, Current, Pos) :- Pos is Current + 2, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on next row, same column
twoZeros(Grid, Current, Pos) :- Pos is Current + 3, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% Try the positon on next row, next column
twoZeros(Grid, Current, Pos) :- Pos is Current + 4, 
		Pos >= 1, Pos =< 9, empty_place(Pos, Grid).

% If none of these work, try next position
twoZeros(Grid, Current, Pos) :- Next is Current + 1,
		(Next =< 9 -> twoZeros(Grid, Next, Pos) ; fail).

% If no position is occupied yet, try a random position.
random_pos(Grid, Pos) :- random(1, 10, Pos), empty_place(Pos, Grid).
random_pos(Grid, Pos) :- random_pos(Grid, Pos), !.

% Find if Pos is empty - this is like empty but without the message.
empty_place(Pos, [Pos:A|_]) :- not(atom(A)), !.
empty_place(Pos, [Pos:_|_]) :- !, fail.
empty_place(Pos, [_:_|T]) :- empty_place(Pos, T), !.
