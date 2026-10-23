
% Winning combinations
win(B, P) :-
    member([A,C,D],
        [[0,1,2],[3,4,5],[6,7,8],
         [0,3,6],[1,4,7],[2,5,8],
         [0,4,8],[2,4,6]]),
    nth0(A, B, P),
    nth0(C, B, P),
    nth0(D, B, P).

% Make a move
move(B, P, N) :-
    nth0(I, B, e),
    replace(B, I, P, N).

% Replace position
replace([_|T], 0, X, [X|T]).

replace([H|T], I, X, [H|R]) :-
    I > 0,
    J is I - 1,
    replace(T, J, X, R).

% Play game
play(B) :-
    write(B), nl,
    ( win(B, x) ->
        writeln('Computer wins!')
    ; win(B, o) ->
        writeln('You win!')
    ; \+ member(e, B) ->
        writeln('Draw!')
    ; write('Enter position (0-8): '),
      read(I),
      ( integer(I),
        between(0, 8, I),
        nth0(I, B, e) ->
          replace(B, I, o, N),
          ( win(N, o) ->
              play(N)
          ; \+ member(e, N) ->
              play(N)
          ; move(N, x, M),
            play(M)
          )
      ; writeln('Invalid position! Try again.'),
        play(B)
      )
    ).

% Start game
start :-
    play([e,e,e,e,e,e,e,e,e]).
