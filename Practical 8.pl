
% Example game tree
tree([3,5,6,9,1,2,0,7]).

% Alpha-Beta pruning (maximum value)
alphabeta([], _, _, V, V).

alphabeta([X|T], Alpha, Beta, V, Best) :-
    NewV is max(V, X),
    NewAlpha is max(Alpha, NewV),
    ( NewAlpha >= Beta ->
        Best = NewV
    ;
        alphabeta(T, NewAlpha, Beta, NewV, Best)
    ).

% Find maximum value
best_value(Best):-
    tree(Values),
    alphabeta(Values, -1000, 1000, -1000, Best).
