encode_modified([], []).
encode_modified([X], [X]).
encode_modified([X, Y|Xs], [X|Zs]) :- X \= Y, encode_modified([Y|Xs], Zs).
encode_modified([X, X|Xs], [[2, X]|Zs]) :- not(is_list(X)), encode_modified([X|Xs], [X|Zs]).
encode_modified([X, X|Xs], [[N1, X]|Zs]) :- encode_modified([X|Xs], [[N, X]|Zs]), N1 is N + 1.

:- begin_tests(tests).

test(encode_modified_empty) :-
	encode_modified([], []).

test(encode_modified_singles, all(X = [[1, 2, 3, 4, 5]])) :-
	encode_modified([1, 2, 3, 4, 5], X).

test(encode_modified_duplicates, all(X = [[[2, 1], [3, 2], [4, 3]]])) :-
	encode_modified([1, 1, 2, 2, 2, 3, 3, 3, 3], X).

test(encode_modified_mixed, all(X = [[1, [2, 2], 3, [4, 4]]])) :-
	encode_modified([1, 2, 2, 3, 4, 4, 4, 4], X).

:- end_tests(tests).
