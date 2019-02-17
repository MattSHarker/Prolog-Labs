
% Matthew Harker
% CS 362
% Lab 5

% people: Adam 1 min, Brianna 2 min, Me 5 min, Charlotte 10 min
change(w, e).
change(e, w).

% move(C1, S, C2)  configuration 1 leads to config 2 if student S crosses the bridge
% last element is the torch
move([X, B, M, C, X], [adam, no_one], [Y, B, M, C, Y]) :- change(X, Y).
move([A, X, M, C, X], [brianna, no_one], [A, Y, M, C, Y]) :- change(X, Y).
move([A, B, X, C, X], [me, no_one], [A, B, Y, C, Y]) :- change(X, Y).
move([A, B, M, X, X], [charlotte, no_one], [A, B, M, Y, Y]) :- change(X, Y).
move([X, X, M, C, X], [adam, brianna], [Y, Y, M, C, Y]) :- change(X, Y).
move([X, B, X, C, X], [adam, me], [Y, B, Y, C, Y]) :- change(X, Y).
move([X, B, M, X, X], [adam, charlotte], [Y, B, M, Y, Y]) :- change(X, Y).
move([A, X, X, C, X], [brianna, me], [A, Y, Y, C, Y]) :- change(X, Y).
move([A, X, M, X, X], [brianna, charlotte], [A, Y, M, Y, Y]) :- change(X, Y).
move([A, B, X, X, X], [me, charlotte], [A, B, Y, Y, Y]) :- change(X, Y).

% when 2 people cross take the longer time
min_time([X, Y], T1) :- time(X, T1), time(Y, T2), T1 >= T2.
min_time([X, Y], T2) :- time(X, T1), time(Y, T2), T1 < T2.

add_time(T1, [X, Y], T2) :- 
    min_time([X, Y], T3),
    T2 = T1 + T3.

% solves the riddle
solution([e,e,e,e,e],[], _).
solution(Config, [Move|Rest], T) :-
    move(Config, Move, NextConfig),
    add_time(T, Move, NextT),
    quick(NextT),
    solution(NextConfig, Rest, NextT),!.

% ensures it gets the correct time
quick(T) :- T =< 17.

% how long it takes a person to cross the bridge
time(no_one, 0).
time(adam, 1).
time(brianna, 2).
time(me, 5).
time(charlotte, 10).

% to run the riddle
puzzle(X) :- num(N), length(X, N), solution([w,w,w,w,w], X, 0).

num(1).
num(X) :- num(Y), X is Y + 1.
