% Exercise 2.4 

% Here are six English words:
% abalone, abandon, anagram, connect, elegant, enhance.

% They are to be arranged in a crossword puzzle like 
% fashion in the grid given below.

% The following knowledge base represents a lexicon
% containing these words.

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

% Write a predicate crosswd/6 that tells us how to fill
% the grid, i.e. the first three arguments should be the
% vertical words from left to right and the following
% three arguments the horizontal words from top to bottom.

crossword(V1,V2,V3,H1,H2,H3):-
word(V1,_,V1H1,_,V1H2,_,V1H3,_),
word(V2,_,V2H1,_,V2H2,_,V2H3,_),
word(V3,_,V3H1,_,V3H2,_,V3H3,_), 
word(H1,_,V1H1,_,V2H1,_,V3H1,_), 
word(H2,_,V1H2,_,V2H2,_,V3H2,_), 
word(H3,_,V1H3,_,V2H3,_,V3H3,_).

% This crossword has 2 solutions:

% One is:
% V1 = abalone,
% V2 = anagram,
% V3 = connect,
% H1 = abandon,
% H2 = elegant,
% H3 = enhance ;

% The other one is:
% V1 = abandon,
% V2 = elegant,
% V3 = enhance,
% H1 = abalone,
% H2 = anagram,
% H3 = connect 

% This solution is pretty simple in the sense that we just
% 'hard coded' the fixed intersection positions that need
% to match. 

% Here is a version of this game that uses the same
% crossword pattern but lets you input 6 words and then
% tells you if you can fill the crossword with them.

fill(Word1, Word2, Word3, Word4, Word5, Word6, V1, V2, V3, H1, H2, H3):- permutation([Word1, Word2, Word3, Word4, Word5, Word6],[W1,W2,W3,W4,W5,W6]),
format(W1, Format1),
format(W2, Format2),
format(W3, Format3),
format(W4, Format4),
format(W5, Format5),
format(W6, Format6),
crossword_fill(Format1, Format2, Format3, Format4, Format5, Format6, V1, V2, V3, H1, H2, H3),write('\n').

format(Word, FormatWord):- string_chars(Word,C), append([Word],C,FormatWord).

crossword_fill(FormatWord1, FormatWord2, FormatWord3, FormatWord4, FormatWord5, FormatWord6, V1, V2, V3, H1, H2, H3):-
[V1,_,V1H1,_,V1H2,_,V1H3,_] = FormatWord1,
[V2,_,V2H1,_,V2H2,_,V2H3,_] = FormatWord2,
[V3,_,V3H1,_,V3H2,_,V3H3,_] = FormatWord3, 
[H1,_,V1H1,_,V2H1,_,V3H1,_] = FormatWord4, 
[H2,_,V1H2,_,V2H2,_,V3H2,_] = FormatWord5, 
[H3,_,V1H3,_,V2H3,_,V3H3,_] = FormatWord6.

% This method permits the input of any 6 words (in any order!)
% so that they can fill the crossword game.
% It will output all possible solutions, separated by a 
% blank line. A possible query could be the one below.
% This is inspired by our example in the previous exercise.

% fill(elegant,abandon,connect,enhance,anagram,abalone,V1,V2,V3,H1,H2,H3).

% V1 = abandon,
% V2 = elegant,
% V3 = enhance,
% H1 = abalone,
% H2 = anagram,
% H3 = connect ;
% 
% V1 = abalone,
% V2 = anagram,
% V3 = connect,
% H1 = abandon,
% H2 = elegant,
% H3 = enhance ;
% false.

% Here is another example.
% Notice that the game works best for words of length 7
% This is because we are keeping the template of the crossword.
% Here is a nice link to all words of a particular length, in case you wanna play a bit  :)
% http://www.litscape.com/words/length/7_letters/7_letter_words.html

% fill(ellipse,alleged,general,detoxes,escapes,ciceros,V1,V2,V3,H1,H2,H3).

% V1 = ellipse,
% V2 = general,
% V3 = detoxes,
% H1 = alleged,
% H2 = ciceros,
% H3 = escapes ;

% V1 = alleged,
% V2 = ciceros,
% V3 = escapes,
% H1 = ellipse,
% H2 = general,
% H3 = detoxes ;
% false.