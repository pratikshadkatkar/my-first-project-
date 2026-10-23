
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

dist(X,Y,D):-
    road(Y,X,D).

% Calculate total tour distance
tour([_], 0).

tour([A,B|T], D) :-
    dist(A,B,D1),
    tour([B|T], D2),
    D is D1 + D2.

% Solve TSP starting from a
tsp(Path, Distance) :-
    Cities = [b,c,d],
    permutation(Cities, Order),
    append([a|Order], [a], Path),
    tour(Path, Distance).

% Find minimum-distance tour
shortest_tour(Path, Distance) :-
    findall(D-P, tsp(P,D), Tours),
    sort(Tours, [Distance-Path|_]).
