% Exercise 7.1

% Write down the ordinary Prolog rules that correspond to these DCG rules.

s --> foo,bar,wiggle.
foo --> [choo].
foo --> foo,foo.
bar --> mar,zar.
mar --> me,my.
me --> [i].
my --> [am].
zar --> blar,car.
blar --> [a].
car --> [train].
wiggle --> [toot].
wiggle --> wiggle,wiggle.

% What are the first three responses that Prolog gives to the query s(X,[])?

% The first response will be: choo i am a train toot
% The second response will be: choo i am a train toot toot
% The third response will be: choo i am a train toot toot toot 

% All the following responses will begin with "choo i am a
% train", followed by a number of occurences for "toot". 
% That is because of the recursive call for wiggle.

% Ordinary Prolog correspondence to the DCG rules above:
s(A,B):-foo(A,D),bar(D,E),wiggle(E,B).
foo([choo|X],X).
foo(A,B):- foo(A,C),foo(C,B).
bar(A,B):- mar(A,C),zar(C,B).
mar(A,B):- me(A,C),my(C,B).
me([i|X],X).
my([am|X],X).
zar(A,B):- blar(A,C),car(C,B).
blar([a|X],X).
car([train|X],X).
wiggle([toot|X],X).
wiggle(A,B):- wiggle(A,C),wiggle(C,B).

% Explanation for this correspondence is that Prolog translates the DCG rules into ordinary Proog rules
% These prolog rules will always look like this:

% This s --> s,p,q. is equivalent to 
% s(First, Last):-s(First, Var1),p(Var1, Var2), q(Var2, Last).

% While this s(Pass1, Pass2)-->p(Pass1), q(Pass2). gets translated to
% s(Pass1, Pass2, First, Last):-p(Pass1, First, Var1), q(Pass2, Var1, Last). 