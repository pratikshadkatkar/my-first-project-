
% Goal state
goal([1,2,3,4,5,6,7,8,0]).

% Misplaced Tiles Heuristic
misplaced_h(S, H) :-
    goal(G),
    misplaced(S, G, H).

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

% Manhattan Distance Heuristic
manhattan_h(S, H) :-
    manhattan(S, 0, H).

manhattan([], _, 0).

manhattan([0|T], I, H) :-
    I1 is I + 1,
    manhattan(T, I1, H).

manhattan([X|T], I, H) :-
    X \= 0,
    G is X - 1,
    R is I // 3,
    C is I mod 3,
    GR is G // 3,
    GC is G mod 3,
    D is abs(R-GR) + abs(C-GC),
    I1 is I + 1,
    manhattan(T, I1, H1),
    H is D + H1.

% Swap positions
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

% Legal moves
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

% Best First Search with node count
best_first(Start, HFun, Path, Count) :-
    search([Start], [], HFun, RevPath, 0, Count),
    reverse(RevPath, Path).

search([S|_], _, _, [S], C, C) :-
    goal(S).

search([S|Rest], Visited, HFun, [S|Path], C0, Count) :-
    findall(N,
        (move(S,N),
         \+ member(N,Visited),
         \+ member(N,Rest)),
        Children),
    append(Rest, Children, All),
    score_states(All, HFun, Scored),
    sort(Scored, Sorted),
    remove_scores(Sorted, Queue),
    C1 is C0 + 1,
    search(Queue, [S|Visited], HFun, Path, C1, Count).

score_states([], _, []).

score_states([S|T], HFun, [H-S|R]) :-
    call(HFun, S, H),
    score_states(T, HFun, R).

remove_scores([], []).

remove_scores([_-S|T], [S|R]) :-
    remove_scores(T, R).
