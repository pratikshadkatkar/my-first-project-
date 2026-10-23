%facts
likes(aasavari,panipuri).
likes(aaditi,icecream).
likes(shruti,choclate).

%rules
relationship(X,Y):-
likes(X,Y);
likes(Y,X).


