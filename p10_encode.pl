encode([], []).
encode([X], [[1, X]]).
encode([X, Y|Xs], [[1, X]|Zs]) :- X \= Y, encode([Y|Xs], Zs).
encode([X, X|Xs], [[N1, X]|Zs]) :- encode([X|Xs], [[N, X]|Zs]), N1 is N + 1.

:- begin_tests(tests).

test(encode_empty) :-
	encode([], []).

test(encode_simple, all(X = [[[1, 1], [2, 2], [3, 3], [4, 4]]])) :-
	encode([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], X).

test(encode_mixed, all(X = [[[1, 1], [2, 2], [1, 3], [4, 4]]])) :-
	encode([1, 2, 2, 3, 4, 4, 4, 4], X).

test(encode_with_lists, all(X = [[[1, 1], [1, 2], [2, [2]], [1, 2], [1, 3], [2, [3, [3, [3]]]], [1, 3]]])) :-
	encode([1, 2, [2], [2], 2, 3, [3, [3, [3]]], [3, [3, [3]]], 3], X).

:- end_tests(tests).
