%_____________________________________________________________
% Arithmetic
%_____________________________________________________________
:- [working_with_lists_P1_to_P28].

% P31 (**) Determine whether a given integer number is prime.
is_prime(X) :- X == 2, !.
is_prime(X) :- X =\= 1, Rest is X mod 2, Rest =\= 0, 
		sqrt(X, Sqrt), is_prime(X, 3, Sqrt), !.
is_prime(_, Divisor, Limit) :- Divisor > Limit.
is_prime(X, Divisor, Limit) :- Rest is X mod Divisor,
		Rest =\= 0, Divisor2 is Divisor + 2,
		is_prime(X, Divisor2, Limit).

% P32 (**) Determine the greatest common divisor of two positive integer numbers.
gcd(X, 0, X) :- X > 0, !.
gcd(X, Y, G) :- Y > 0, Rest is X mod Y, gcd(Y, Rest, G).

% P33 (*) Determine whether two positive integer numbers are coprime.
coprime(X, Y) :- gcd(X, Y, 1).

% P34 (**) Calculate Euler's totient function phi(m) defined as the
% number of positive integers r (1 <= r < m) that are coprime to m.
:- arithmetic_function(totient_phi/1).
totient_phi(1, 1) :- !.
totient_phi(X, Phi) :- Y is X - 1, totient_phi(X, Y, 0, Phi),!.
totient_phi(_, 0, Phi, Phi).
totient_phi(X, Y, Acc, Phi) :- coprime(X, Y), Y1 is Y - 1, 
		Acc1 is Acc + 1, totient_phi(X, Y1, Acc1, Phi).
totient_phi(X, Y, Acc, Phi) :- Y1 is Y - 1, 
		totient_phi(X, Y1, Acc, Phi).

% P35 (**) Determine the prime factors of a given positive integer. 
genNextPrime(N, N) :- is_prime(N),!.
genNextPrime(N, P) :- N1 is N + 1, genNextPrime(N1, P).

prime_factors(N, L) :- prime_factors(N, 2, [], L),!.
prime_factors(1, _, Acc, Acc).
prime_factors(N, Factor, Acc, L) :- Rest is N mod Factor, Rest == 0,
		append(Acc, [Factor], Acc1),
		N1 is N / Factor,
		prime_factors(N1, Factor, Acc1, L).
prime_factors(N, Factor, Acc, L) :- Factor1 is Factor + 1,
		genNextPrime(Factor1, Factor2),
		prime_factors(N, Factor2, Acc, L).

% P36 (**) Determine the prime factors of a given positive integer (2).
prime_factors_mult(N, L) :- prime_factors(N, L1), pack(L1, Pack),
		count(Pack,L,[]), !.
count([], Acc, Acc).
count([H|T], L, Acc) :- [H1|_] = H, len(H, N),
		append(Acc,[[H1, N]], AccNew),
		count(T, L, AccNew).

% P37 (**) Calculate Euler's totient function phi(m) (improved).
:- arithmetic_function(phi/1).
phi(X, Phi) :- prime_factors_mult(X, Factors), phiF(Factors, Phi).
phiF([], 1).
phiF([[H|T]|L], Phi) :- phiF(L, Phi1), H1 is H - 1, T1 is T - 1,
		pow(H, T1, Power), This is H1 * Power, Phi is This * Phi1.

% P38 (*) Compare the two methods of calculating Euler's totient function.

% X is phi(100090).
% X = 40032.
% The phi predicate runs faster.

% X is totient_phi(100090).
% after some time
% X = 40032.
% The totient_phi runs slower.

% P39 (*) A list of prime numbers.
primeBetween(A, B, []) :- A > B.
primeBetween(A, B, [A|List]) :- is_prime(A), A1 is A + 1,
		primeBetween(A1, B, List), !.
primeBetween(A, B, List) :- A1 is A + 1, 
		primeBetween(A1, B, List), !.

% P40 (**) Goldbach's conjecture - says that every positive 
% even number greater than 2 is the sum of two prime numbers
goldbach(N, L) :- N > 2, M is N mod 2, M == 0, 
		primeBetween(2,N,Primes), gb(N, Primes, L), !.
gb(N, [X|T], [X, Y]) :- Y is N - X, member(Y, T).
gb(N, [_|T], L) :- gb(N, T, L).


% P41 (**) A list of Goldbach compositions.

% Given a range of integers by its lower and upper limit
% print a list of all even numbers and their Goldbach composition.
goldbach_list(A, B) :- goldbach_list(A, B, 2).

% Because very rarely the primes are both bigger than 50
% we try to find how many such cases there are in range 2,3000.
goldbach_list(A, B, Limit) :- M is A mod 2, M == 1, A1 is A + 1,
		goldbach_list(A1, B, Limit), !.
goldbach_list(A, B, _) :- A > B.
goldbach_list(A, B, Limit) :- goldbach(A, [X, Y]), X >= Limit,
		writef('%t = %t + %t',[A,X,Y]), nl, 
		A1 is A + 1, goldbach_list(A1, B, Limit).
goldbach_list(A, B, Limit) :- 
		A1 is A + 1, goldbach_list(A1, B, Limit).
												
