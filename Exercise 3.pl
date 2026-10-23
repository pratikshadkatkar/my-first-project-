
% Move Up
move(X, Y, X, NY) :-
    NY is Y - 1.

% Move Left
move(X, Y, NX, Y) :-
    NX is X - 1.

% Move Down
move(X, Y, X, NY) :-
    NY is Y + 1.

% Move Right
move(X, Y, NX, Y) :-
    NX is X + 1.
