likes(aasavari,horror).
likes(aaditi,romantic).
likes(nidhi,sports).
likes(sneha,emotional).
likes(shruti,thriller).
likes(anushka,action).

movie(conjuring,horror).
movie(taqdeer,romantic).
movie(spider,thriller).
movie(kgf,action).
movie(shiddat,emotional).
movie(dangal,sports).

recommend(User, Movie) :-
 likes(User, Category),
 movie(Movie, Category).
