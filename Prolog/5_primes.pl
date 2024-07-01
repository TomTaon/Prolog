has_factor(N, L) :- 
    N mod L =:= 0.
has_factor(N, L) :-
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).


is_prime(2) :-
    !.
is_prime(3) :-
    !.
is_prime(P) :-
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).


primes(From, To, X) :- 
    findall(P, (between(From, To, P), is_prime(P), write(P), nl), X).


