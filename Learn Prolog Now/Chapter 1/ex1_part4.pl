% Exercise 1.4

% Represent the following in Prolog:

% 1. Butch is a killer.

killer(butch).

% 2. Mia and Marcellus are married.

married(mia, marcellus).

% 3. Zed is dead.

dead(zed).

% 4. Marcellus kills everyone who gives Mia a footmassage.

kill(marcellus, WillBeDead):- gives_footmassage(WillBeDead, mia).

% 5. Mia loves everyone who is a good dancer.
love(mia, Person):- is_good_dancer(Person).

% 6. Jules eats anything that is nutritious or tasty.
eats(jules, Food):- nutritious(Food);tasty(Food).