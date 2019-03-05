
% Matthew Harker
% CS 362
% Lab 7

year([], _).
year([HY|TY], [HX|TX]) :-
    HX = [HY, _, _, _], year(TY, TX).

claimedJobs([], _).
claimedJobs([H|T], L) :-
    member([_, H, _, _], L),
    claimedJobs(T, L).

regions([], _).
regions([H|T], L) :-
    member([_, _, H, _], L),
    regions(T, L).

actualJobs([], _).
actualJobs([H|T], L) :-
    member([_, _, _, H], L),
    actualJobs(T, L).

hint1(X) :-
    member([_, foreignLegionnaire, eastAfrica, _], X).

hint2(X) :-
    member([Y1, _, _, mailMan], X),
    member([Y2, _, _, server], X),
    Y2 is Y1 + 3.

hint3(X) :-
    member([1976, _, middleEast, _], X).

hint4(X) :-
    member([Y1, treasureHunter, _, hotelPage], X),
    member([Y2, _, sovietUnion, _], X),
    Y2 is Y1 + 3.

hint5(X) :-
    member([1982, _, _, taxiDriver], X).

hint6(X) :-
    member([Y1, shpee, _, _], X),
    member([Y2, _, _, server], X),
    Y1 \= Y2.

puzzle(X) :-
    length(X, 4),
    year([1973, 1976, 1979, 1982], X),
    claimedJobs([foreignLegionnaire, shpee, bodyguard, treasureHunter], X),
    regions([middleEast, eastAfrica, sovietUnion, southAmerica], X),
    actualJobs([mailMan, hotelPage, server, taxiDriver], X),
    hint1(X),
    hint2(X),
    hint3(X),
    hint4(X),
    hint5(X),
    hint6(X).