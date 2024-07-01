% Predykat pomocniczy do dzielenia listy na dwie mniejsze
split([], [], []).
split([X], [X], []).
split([X,Y|Rest], [X|L1], [Y|L2]) :-
    split(Rest, L1, L2).

% Predykat pomocniczy do scalania dwóch posortowanych list
merge([], L, L).
merge(L, [], L).
merge([X|L1], [Y|L2], [X|L3]) :-
    X =< Y,
    merge(L1, [Y|L2], L3).
merge([X|L1], [Y|L2], [Y|L3]) :-
    X > Y,
    merge([X|L1], L2, L3).

% Predykat implementujący sortowanie przez scalanie
mergesort([], []).
mergesort([X], [X]).
mergesort(List, Sorted) :-
    List = [_,_|_],  % sprawdzenie, czy lista ma więcej niż jeden element
    split(List, L1, L2),
    mergesort(L1, Sorted1),
    mergesort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).
