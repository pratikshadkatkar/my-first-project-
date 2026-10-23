
% Goal state
goal([1,2,3,4,5,6,7,8,0]).

% Count misplaced tiles (Heuristic)
heuristic(State, H) :-
    goal(Goal),
    misplaced(State, Goal, H).

misplaced([], [], 0).

misplaced([0|S], [_|G], H) :-
    misplaced(S, G, H).

misplaced([X|S], [X|G], H) :-
    X \= 0,
    misplaced(S, G, H).

misplaced([X|S], [Y|G], H) :-
    X \= 0,
    X \= Y,
    misplaced(S, G, H1),
    H is H1 + 1.

% Swap two positions
swap(L, I, J, R) :-
    nth0(I, L, A),
    nth0(J, L, B),
    set_nth0(L, I, B, T),
    set_nth0(T, J, A, R).

set_nth0([_|T], 0, X, [X|T]).

set_nth0([H|T], I, X, [H|R]) :-
    I > 0,
    I1 is I - 1,
    set_nth0(T, I1, X, R).

% Legal moves for blank space (0)
move(S, N) :-
    nth0(I, S, 0),
    J is I - 3,
    J >= 0,
    swap(S, I, J, N).

move(S, N) :-
    nth0(I, S, 0),
    J is I + 3,
    J < 9,
    swap(S, I, J, N).

move(S, N) :-
    nth0(I, S, 0),
    I mod 3 =\= 0,
    J is I - 1,
    swap(S, I, J, N).

move(S, N) :-
    nth0(I, S, 0),
    I mod 3 =\= 2,
    J is I + 1,
    swap(S, I, J, N).

% Best First Search
best_first(Start, Path) :-
    search([Start], [], RevPath),
    reverse(RevPath, Path).

search([S|_], _, [S]) :-
    goal(S).

search([S|Rest], Visited, [S|Path]) :-
    findall(N,
        (move(S, N),
         \+ member(N, Visited),
         \+ member(N, Rest)),
        Children),
    append(Rest, Children, All),
    score_states(All, Scored),
    sort(Scored, Sorted),
    remove_scores(Sorted, Queue),
    search(Queue, [S|Visited], Path).

score_states([], []).

score_states([S|T], [H-S|R]) :-
    heuristic(S, H),
    score_states(T, R).

remove_scores([], []).

remove_scores([_-S|T], [S|R]) :-
    remove_scores(T, R).
