extended_gcd(A, 0, 1, 0) :- A =\= 0.
extended_gcd(A, B, X, Y) :-
    B =\= 0,
    R is A mod B,
    Q is A // B,
    extended_gcd(B, R, X1, Y1),
    X is Y1,
    Y is X1 - Q * Y1,
    !.


de(A, B, X, Y, Z) :-
    extended_gcd(A, B, X, Y),
    Z is A * X + B * Y. 