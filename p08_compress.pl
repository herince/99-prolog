compress([], []).
compress([X], [X]).
compress([X, X|T], [X|Ys]) :- compress([X|T], [X|Ys]).
compress([X, N|Xs], [X|Ys]) :- X \= N, compress([N|Xs], Ys).

:- begin_tests(tests).

test(compress_empty) :-
	compress([], []).

test(compress_compressed, all(X = [[1, 2, 3]])) :-
	compress([1, 2, 3], X).

test(compress_simple, all(X = [[1, 2, 3, 4]])) :-
	compress([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], X).

test(compress_mixed, all(X = [[1, 2, 3, 4]])) :-
	compress([1, 2, 2, 3, 4, 4, 4, 4], X).

test(compress_with_lists, all(X = [[1, 2, [2], 2, 3, [3, [3, [3]]], 3]])) :-
	compress([1, 2, [2], [2], 2, 3, [3, [3, [3]]], [3, [3, [3]]], 3], X).

:- end_tests(tests).
