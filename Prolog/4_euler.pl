gcd(X, 0, X) :- 
    !.
gcd(X, Y, A) :-
    Y > 0,
    Z is X mod Y, 
    gcd(Y, Z, A).


totient(N,       N, Count, Count) :- 
    !.
totient(N, Current, Count, Total) :-
    (gcd(N, Current, 1) -> NextCount is Count + 1
    ;  NextCount is Count),
    NextCurrent is Current + 1,
    totient(N, NextCurrent + 1, NextCount, Total).


totient(N, T) :- 
    totient(N, 1, 0, T).