
% Leaf values
tree([2,3,5,9,0,1,7,5]).

% Alpha-Beta pruning
alphabeta([], _, _, V, V).

alphabeta([X|T], Alpha, Beta, V, Best) :-
    NewV is max(V, X),
    NewAlpha is max(Alpha, NewV),
    ( NewAlpha >= Beta ->
        Best = NewV
    ;
        alphabeta(T, NewAlpha, Beta, NewV, Best)
    ).

% Find best value
best_value(Best):-
    tree(Values),
    alphabeta(Values, -1000, 1000, -1000, Best).
