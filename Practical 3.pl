
% Edges between nodes
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
edge(d,e).

% Depth First Search
dfs(Start, Goal, Path) :-
    dfs_path(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

dfs_path(Goal, Goal, Visited, Visited).

dfs_path(Node, Goal, Visited, Path) :-
    edge(Node, Next),
    \+ member(Next, Visited),
    dfs_path(Next, Goal, [Next|Visited], Path).
