% Exercise 2.3 

% Here is a tiny lexicon and mini grammar with only one
% rule which defines a sentence as consisting of five
% words: an article, a noun, a verb, and again an
% article and a noun.


word(article,a).
word(article,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5) :-
word(article,Word1),
word(noun,Word2),
word(verb,Word3),
word(article,Word4),
word(noun,Word5).


% What query do you have to pose in order to find out
% which sentences the grammar can generate? 
% Answer: the query should look something like this:
% sentence(Article1, Noun1, Verb, Article2, Noun2).

% List all sentences that this grammar can generate in 
% the order Prolog will generate them. Make sure that you
% understand why Prolog generates them in this order.

% The first article is matched to 'a'
% The first noun is matched to 'criminal'
% The verb is first matched with 'eats'
% The second article is first matched to 'a'
% Now we display the two possible solutions for Noun2
% 1. a criminal eats a criminal
% 2. a criminal eats a big kahuna burger

% Now the second article is matched with 'every'
% There are still 2 possible solutions for Noun2
% 3. a criminal eats every criminal
% 4. a criminal eats every big kahuna burger

% Now we have to repeat this for the verb 'likes'
% 5. a criminal likes a criminal
% 6. a criminal likes a big kahuna burger
% 7. a criminal likes every criminal
% 8. a criminal likes every big kahuna burger

% Now Noun1 is mathced to 'big kahuna burger'
% Everything to its right follows the steps above
% 9. a big kahuna burger eats a criminal
% 10. a big kahuna burger eats a big kahuna burger
% 11. a big kahuna burger eats every criminal
% 12. a big kahuna burger eats every big kahuna burger

% 13. a big kahuna burger likes a criminal
% 14. a big kahuna burger likes a big kahuna burger
% 15. a big kahuna burger likes every criminal
% 16. a big kahuna burger likes every big kahuna burger

% Now Article1 matches 'every' so we have to repeat all
% sentences above but replacing the first 'a' with 'every'
% 17. every criminal eats a criminal
% 18. every criminal eats a big kahuna burger
% 19. every criminal eats every criminal
% 20. every criminal eats every big kahuna burger

% 21. every criminal likes a criminal
% 22. every criminal likes a big kahuna burger
% 23. every criminal likes every criminal
% 24. every criminal likes every big kahuna burger

% 25. every big kahuna burger eats a criminal
% 26. every big kahuna burger eats a big kahuna burger
% 27. every big kahuna burger eats every criminal
% 28. every big kahuna burger eats every big kahuna burger

% 29. every big kahuna burger likes a criminal
% 30. every big kahuna burger likes a big kahuna burger
% 31. every big kahuna burger likes every criminal
% 32. every big kahuna burger likes every big kahuna burger