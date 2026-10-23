
% Winning combinations
win(B, P) :-
    member([A,C,D],
        [[0,1,2],[3,4,5],[6,7,8],
         [0,3,6],[1,4,7],[2,5,8],
         [0,4,8],[2,4,6]]),
    nth0(A, B, P),
    nth0(C, B, P),
    nth0(D, B, P).

% Evaluate board
value(B, 1) :-
    win(B, x), !.

value(B, -1) :-
    win(B, o), !.

value(B, 0) :-
    \+ member(e, B).

% Make a move
move(B, P, N) :-
    nth0(I, B, e),
    replace(B, I, P, N).

replace([_|T], 0, X, [X|T]).

replace([H|T], I, X, [H|R]) :-
    I > 0,
    J is I - 1,
    replace(T, J, X, R).

% Minimax algorithm
minimax(B, _, V) :-
    value(B, V), !.

minimax(B, x, V) :-
    findall(S,
        (move(B, x, N), minimax(N, o, S)),
        Scores),
    max_list(Scores, V).

minimax(B, o, V) :-
    findall(S,
        (move(B, o, N), minimax(N, x, S)),
        Scores),
    min_list(Scores, V).

% Find best move for x
best_move(B, Move) :-
    findall(V-I,
        (nth0(I, B, e),
         replace(B, I, x, N),
         minimax(N, o, V)),
        Scores),
    keysort(Scores, Sorted),
    reverse(Sorted, [_-Move|_]).

% Initial board
initial([e,e,e,e,e,e,e,e,e]).
