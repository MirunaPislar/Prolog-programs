% Exercise 3.3

% We have the following knowledge base:

directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

% That is, this knowledge base holds facts about towns it 
% is possible to travel between by taking a direct train.
% But of course, we can travel further by ‘chaining 
% together’ direct train journeys. Write a recursive
% predicate travelBetween/2 that tells us when we
% can travel by train between two towns. For example, 
% when given the query 
% travelBetween(nancy,saarbruecken).
% it should reply ‘yes’.

% It is, furthermore, plausible to assume that whenever
% it is possible to take a direct train from A to B, it
% is also possible to take a direct train from B to A.
% Can you encode this in Prolog? You program should e.g.
% answer ‘yes’ to the following query:
% travelBetween(saarbruecken,nancy).
% Do you see any problems you program may run into?

travelBetween(A,B):-(directTrain(A,B);directTrain(B,A)),!.
travelBetween(A,B):-(directTrain(A,C),travelBetween(C,B),!);(directTrain(C,A),travelBetween(B,C),!).

% Without the cuts we would have obtained an endless 
% recursion when implementing the travel not just between 
% A and B but also between B and A. Now we will be given
% a true response no matter from what point we begin our
% travel. (as long as the two points are reachable 
% through a direct train)