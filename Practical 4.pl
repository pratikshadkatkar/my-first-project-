
% Edges between nodes
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
edge(d,e).

% Breadth First Search
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([[Node|Rest]|Queue], Goal, Path) :-
    findall([Next,Node|Rest],
        (edge(Node,Next),
         \+ member(Next,[Node|Rest])),
        NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Path).
