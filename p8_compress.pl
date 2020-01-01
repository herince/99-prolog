compress([], []).
compress([X], [X]).
compress([X, X | T], [X | Ys]) :- compress([X | T], [X | Ys]).
compress([X, Y | T], [X | Ys]) :- X \= Y, compress([Y | T], Ys).

:- begin_tests(tests).

test(compress_empty) :-
	compress([], []).

test(compress_compressed, all(Count = [1])) :-
	compress([1, 2, 3], [1, 2, 3]).

test(compress_simple, all(Count = [1])) :-
	compress([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], [1, 2, 3, 4]).

test(compress_mixed, all(Count = [1])) :-
	compress([1, 2, 2, 3, 4, 4, 4, 4], [1, 2, 3, 4]).

test(compress_with_lists, all(Count = [1])) :-
	compress([1, 2, [2], [2], 2, 3, [3, [3, [3]]], [3, [3, [3]]], 3],
    [1, 2, [2], 2, 3, [3, [3, [3]]], 3]).

:- end tests(tests)
