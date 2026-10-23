
% Edges between nodes
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
edge(d,e).

% Breadth First Search (BFS)
bfs(Start, Goal, Path, Count) :-
    bfs_queue([[Start]], Goal, RevPath, 0, Count),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest], Count, Count).

bfs_queue([[Node|Rest]|Queue], Goal, Path, Count0, Count) :-
    Count1 is Count0 + 1,
    findall([Next,Node|Rest],
        (edge(Node,Next), \+ member(Next,[Node|Rest])),
        NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Path, Count1, Count).

% Depth First Search (DFS)
dfs(Start, Goal, Path, Count) :-
    dfs_path(Start, Goal, [Start], RevPath, 0, Count),
    reverse(RevPath, Path).

dfs_path(Goal, Goal, Visited, Visited, Count, Count).

dfs_path(Node, Goal, Visited, Path, Count0, Count) :-
    Count1 is Count0 + 1,
    edge(Node, Next),
    \+ member(Next, Visited),
    dfs_path(Next, Goal, [Next|Visited], Path, Count1, Count).
