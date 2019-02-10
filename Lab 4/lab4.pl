% Matthew Harker

%finds the median between A, B, and C
median(A, B, C, X) :- X=A, B=<A, A=<C.
median(A, B, C, X) :- X=A, C=<A, A=<B.
median(A, B, C, X) :- X=B, A=<B, B=<C.
median(A, B, C, X) :- X=B, C=<B, B=<A.
median(A, B, C, X) :- X=C, A=<C, C=<B.
median(A, B, C, X) :- X=C, B=<C, C=<A.

% true if the list [H|T] contains X
contains([H|T], X) :- X = H; contains(T, X).

% true if X is greater/equal to all of th elements in [H|T]
largerEqual([], _X).
largerEqual([H|T], X) :- X >= H, largerEqual(T, X).

% true if X is the largest element in the list
max([H|T], X) :- contains([H|T], X), largerEqual([H|T], X).