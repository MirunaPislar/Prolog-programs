%_____________________________________________________________
% Working with Prolog lists
%_____________________________________________________________

% P01 (*) Find the last element of a list.
my_last(X, [X | []]).
my_last(X, [_|L]) :- my_last(X,L), !.

% P02 (*) Find the last but one element of a list.
my_last_but_one(X, [X|[_]]).
my_last_but_one(X, [_|L]) :- my_last_but_one(X,L), !.

% P03 (*) Find the K'th element of a list.
element_at(X, [X|_], 1).
element_at(X, [_|L], K) :- K1 is K - 1, element_at(X, L, K1), !.

% P04 (*) Find the number of elements of a list.
len(List, Len) :- lenAcc(List, Len, 0), !.
lenAcc([], Acc, Acc).
lenAcc([_|L], Len, Acc) :- Acc1 is Acc + 1, lenAcc(L, Len, Acc1).

% P05 (*) Reverse a list.
rev(List, Rev) :- revAcc(List, Rev, []).
revAcc([], Acc, Acc).
revAcc([X|List], Rev, Acc) :- revAcc(List, Rev, [X|Acc]).

% P06 (*) Find out whether a list is a palindrome.
palindrome(List) :- rev(List, List).

% P07 (**) Flatten a nested list structure.
my_flatten(List, Flat) :- my_flattenAcc(List, [], Flat), !.
my_flattenAcc([], Acc, Acc) :- !.
my_flattenAcc([X|List], Acc, Flat) :- is_list(X), 
		my_flatten(X, FlatX),
		append(Acc, FlatX, AccNew),
		my_flattenAcc(List, AccNew, Flat).
my_flattenAcc([X|List], Acc, Flat) :- append(Acc, [X], AccNew), 
		my_flattenAcc(List, AccNew, Flat).
																											
% P08 (**) Eliminate consecutive duplicates of list elements.
compress([], []).
compress([X|List], Comp) :- compressAcc([X | List], [X], Comp), !.
compressAcc([_], Acc, Acc).
compressAcc([Prev, Prev|List], Acc, Comp) :- 
		compressAcc([Prev|List], Acc, Comp).
compressAcc([_, Elem|List], Acc, Comp) :- append(Acc, [Elem], Acc1),
		compressAcc([Elem|List], Acc1, Comp).

% P09 (**) Pack consecutive duplicates of list elements into sublists.
pack([], []).
pack([X|List], Pack) :- packAcc([X|List], [], Pack, [X]), !.
packAcc([_], Acc1, Pack, Acc2):- append(Acc1, [Acc2], Pack).
packAcc([Prev, Prev|List], Acc1, Pack, Acc2) :-
		packAcc([Prev|List], Acc1, Pack, [Prev|Acc2]).
packAcc([_, Elem|List], Acc1, Pack, Acc2) :- 
		append(Acc1, [Acc2], Acc3),
		packAcc([Elem|List], Acc3, Pack, [Elem]).
																					
% P10 (*) Run-length encoding of a list.
encode(List, Encoded) :- pack(List, Pack), 
										encode_each(Pack,Encoded,[]),!.
encode_each([], Acc, Acc).
encode_each([H|T], Encoded, Acc) :- [H1|_] = H, len(H, N),
		append(Acc,[[N, H1]], AccNew),
		encode_each(T, Encoded, AccNew).

% P11 (*) Modified run-length encoding.
encode_modified(List, Encoded) :- pack(List, Pack), 
		encode_each_modif(Pack,Encoded,[]),!.
encode_each_modif([], Acc, Acc).
encode_each_modif([H|T], Encoded, Acc) :- [H1|_] = H, 
		len(H, N), N == 1,
		append(Acc,[H1], AccNew),
		encode_each_modif(T, Encoded, AccNew).
encode_each_modif([H|T], Encoded, Acc) :- [H1|_] = H, 
		len(H, N),
		append(Acc,[[N, H1]], AccNew),
		encode_each_modif(T, Encoded, AccNew).

% P12 (**) Decode a run-length encoded list.
decode(List, Decoded) :- decodeAcc(List, [], Decoded),!.
decodeAcc([], Acc, Acc).
decodeAcc([X|List], Acc, Decoded) :- is_list(X), [H|T] = X, 
		[H1|_] = T, expand(H1, H, Res), 
		append(Acc, Res, AccNew),
		decodeAcc(List, AccNew, Decoded).
decodeAcc([X|List], Acc, Decoded) :-
		append(Acc, [X], AccNew),
		decodeAcc(List, AccNew, Decoded).
expand(_, 0, []).
expand(E, N, [E|Res]) :- N1 is N - 1, expand(E, N1, Res), !.

% P13 (**) Run-length encoding of a list (direct solution).
encode_direct(List, En) :-  compress(List, Comp), 
		encode_direct(List, Comp, 0, [], En),!.
encode_direct([], [X|_], N, Acc, Acc1) :- N == 1, 
		append(Acc,[X], Acc1).
encode_direct([], [X|_], N, Acc, Acc1) :- append(Acc,[[N,X]], Acc1).
encode_direct([H|T], [H|Y], N, Acc, En) :- N1 is N + 1,
		encode_direct(T, [H|Y], N1, Acc, En).
encode_direct([H|T], [X|Y], N, Acc, En) :- N == 1,
		append(Acc, [X], Acc1),
		encode_direct([H|T], Y, 0, Acc1, En).
encode_direct([H|T], [X|Y], N, Acc, En) :-
		append(Acc, [[N, X]], Acc1),
		encode_direct([H|T], Y, 0, Acc1, En).

% P14 (*) Duplicate the elements of a list.
dupli(List, Dupl):-dupliAcc(List, [], Dupl).
dupliAcc([], Acc, Acc).
dupliAcc([H|T], Acc, Dupl) :- append(Acc, [H, H], AccNew),
		dupliAcc(T, AccNew, Dupl).

% P15 (**) Duplicate the elements of a list a given number of times.
dupli(List, N, Dupl) :- dupliAcc(List, N, [], Dupl).
dupliAcc([], _, Acc, Acc).
dupliAcc([H|T], N, Acc, Dupl) :- expand(H, N, Res),
		append(Acc, Res, AccNew),
										dupliAcc(T, N, AccNew, Dupl).

% P16 (**) Drop every N'th element from a list.
drop(List, N, Drop) :- drop(List,N,1,[],Drop),!.
drop([], _, _,Acc, Acc).
drop([_|T], N, N, Acc, Drop):- drop(T,N,1,Acc,Drop).
drop([H|T], N, K, Acc, Drop):- K1 is K + 1, 
		append(Acc,[H],AccNew), 
		drop(T,N,K1,AccNew,Drop).

% P17 (*) Split a list into two parts; the length of the first part is given.
split(List,N,L1,L2) :- split(List,N,0,[],L1,L2),!.
split(L,N,N,Acc,Acc,L).
split([H|T],N,K,Acc,L1,L2) :- K1 is K + 1,
		append(Acc,[H],AccNew),
		split(T,N,K1,AccNew,L1,L2).

% P18 (**) Extract a slice from a list.
slice(List, K, I, Sliced):- K1 is K - 1,
		split(List, I, List1,_),
		split(List1, K1,_,Sliced).
										
% P19 (**) Rotate a list N places to the left.
rotate(List, N, Rotated) :- length(List, L), 
		N1 is L + N, N2 is N1 mod L,
		split(List, N2, L1, L2), 
		append(L2, L1, Rotated).

% P20 (*) Remove the K'th element from a list.
remove_at(X, List, N, R) :- N1 is N - 1,
		split(List, N1, L1, [X|L2]),
		append(L1,L2,R),!.

% P21 (*) Insert an element at a given position into a list.
insert_at(Elem, List, N, Result) :- N1 is N - 1,
		split(List, N1, L1, L2),
		append(L1, [Elem], L3),
		append(L3, L2, Result).

% P22 (*) Create a list containing all integers within a given range.
range(X, Y, List) :- Y1 is Y + 1, range(X, Y1, [], List),!.
range(Y, Y, Acc, Acc).
range(X, Y, Acc, List) :- X1 is X + 1, append(Acc, [X], AccNew),
		range(X1, Y, AccNew, List).

% P23 (**) Extract a given number of randomly selected elements from a list.
rnd_select(_, 0, []).
rnd_select(List, N, [X|Random]) :- is_list(List),
		length(List, Len), L is Len + 1, random(1, L, Rand),
		N1 is N - 1, remove_at(X, List, Rand, Result),
		rnd_select(Result, N1, Random),!.
										
% P24 (*) Lotto: Draw N different random numbers from the set 1..M.
rnd_select(N,M,L) :- number(N), range(1,M,List), 
		rnd_select(List, N, L),!.

% P25 (*) Generate a random permutation of the elements of a list. 
rnd_permu(List, Random) :- length(List, Len), 
		rnd_select(List, Len, Random).

% P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
combination(0,_,[]) :- !.
combination(K, [H|T],[H|L]) :- K1 is K - 1, combination(K1,T,L).
combination(K, [_|T], L) :- combination(K,T,L).

% P27 (**) Group the elements of a set into disjoint subsets.
% A. group3(List, G1, G2, G3) :- group3(List, ).
group3(List, Comb1, Comb2, Comb3) :- combination(2, List, Comb1),
		subtract(List, Comb1, Dif1),
		combination(3, Dif1, Comb2),
		subtract(Dif1, Comb2, Dif2),
		combination(4, Dif2, Comb3).

% B. Generalize the above predicate in a way that we can specify a
% list of group sizes and the predicate return a list of groups.
group(List, No, Gs) :- group(List, No, [], Gs).
group(_, [], Acc, Acc).										
group(List, [H|T], Acc, Gs) :- combination(H, List, Comb),
		append(Acc, [Comb], Acc1),
		subtract(List, Comb, Dif),
		group(Dif, T, Acc1, Gs).

% P28 (**) Sorting a list of lists according to length of sublists
% A. Sort the elements of InList according to their length
lsort(List, L) :- lsort(List, [], L), !.
lsort([], L, L).
lsort([H|T], Acc, L) :- length(H, LenH), 
		linsert(H, LenH, Acc, Acc1),
		lsort(T, Acc1, L).
linsert(X, LenX, [H|T], [X, H|T]) :- length(H, LenH), LenX < LenH.
linsert(X, LenX, [H|T], [H|Acc1]) :- length(H, LenH),
		LenX >= LenH, linsert(X, LenX, T, Acc1).
linsert(X, _, [], [X]).
											
% B. Sort the elements of InList according to their length frequency
lfsort(List, L) :- lfsort(List, [], L, List), !.
lfsort([], L, L, _).
lfsort([H|T], Acc, L, Whole) :- length(H, LenH), 
		lenFreq(LenH, Whole, FreqH), 
		lfinsert(H, FreqH, Acc, Acc1, Whole),
		lfsort(T, Acc1, L, Whole).
lfinsert(X, FreqX, [H|T], [X, H|T], Whole) :- 
		length(H, LenH), lenFreq(LenH, Whole, FreqH),
		FreqX < FreqH.
lfinsert(X, FreqX, [H|T], [H|Acc1], Whole) :-
		length(H, LenH), lenFreq(LenH, Whole, FreqH),
		FreqX >= FreqH,
		lfinsert(X, FreqX, T, Acc1, Whole).
lfinsert(X, _, [], [X], _).

% Helper - calculate the frequency of a length in a list of lists.
lenFreq(_, [], 0).
lenFreq(Len, [H|T], Freq) :- lenFreq(Len, T, Freq1), 
		length(H, LenH), Len == LenH, 
		Freq is Freq1 + 1, !.
lenFreq(Len, [_|T], Freq) :- lenFreq(Len, T, Freq),!.
													
