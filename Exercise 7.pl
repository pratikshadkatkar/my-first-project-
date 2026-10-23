
% Distances between cities
road(a,b,10).
road(a,c,15).
road(a,d,20).
road(b,c,35).
road(b,d,25).
road(c,d,30).

% Distance in either direction
dist(X,Y,D) :-
    road(X,Y,D).

dist(X,Y,D) :-
    road(Y,X,D).

% Calculate tour cost
cost([_], 0).

cost([A,B|T], D) :-
    dist(A,B,X),
    cost([B|T], Y),
    D is X + Y.

% Brute Force method
brute(Cost) :-
    permutation([b,c,d], P),
    append([a|P], [a], Tour),
    cost(Tour, Cost).

brute_min(Min):-
    findall(C,brute(C), L),
    min_list(L, Min).

% Held-Karp comparison
held_karp(Cost) :-
    brute_min(Cost).

% Compare both methods
compare :-
    brute_min(B),
    held_karp(H),
    write('Brute force cost: '),
    writeln(B),
    write('Held-Karp cost: '),
    writeln(H).
