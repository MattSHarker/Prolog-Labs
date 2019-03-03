
% Matthew Harker
% CS 362
% Lab 6

% subseq(X, L) :- X is subsequence of L.
subseq([], []).
subseq(X, [_ | RestY]) :- subseq(X, RestY).
subseq([Item | RestX], [Item | RestY]) :- subseq(RestX, RestY).


% true if any element of [H|T] is in L
hitsAll([], _).
hitsAll([H|T], L) :-
    intersection(H, L, I), I \= [], hitsAll(T, L).


% X is the union of all of the lists
unionAll([], []).
unionAll([H|T], X) :-
    unionAll(T, Union),
    union(H, Union, X).

% finds the smallest length list
minLength([S], S).
minLength([H|T], MT) :-
    minLength(T, MT),
    length(MT, LT),
    length(H, LH),
    LT =< LH.
minLength([H|T], H) :-
    minLength(T, MT),
    length(MT, LT),
    length(H, LH),
    LT > LH.

% creates a hitting set L of a collection of sets C
hittingSet(C, L) :-
    unionAll(C, Union),
    subseq(L, Union),
    L \= [],
    hitsAll(C, L).

% produces a minimal hitting set X of a collection of sets C
minHittingSet(C, X) :-
    findall(L, hittingSet(C, L), HS),
    minLength(HS, X).