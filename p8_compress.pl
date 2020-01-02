compress([], []).
compress([X], [X]).
compress([X, X|T], [X|Ys]) :- compress([X|T], [X|Ys]).
compress([X, N|Xs], [X|Ys]) :- X \= N, compress([N|Xs], Ys).

:- begin_tests(tests).

% todo: fix test warnings

test(compress_empty) :-
	compress([], []).

test(compress_compressed, all(L = [1])) :-
	compress([1, 2, 3], [1, 2, 3]).

test(compress_simple, all(L = [1])) :-
	compress([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], [1, 2, 3, 4]).

test(compress_mixed, all(L = [1])) :-
	compress([1, 2, 2, 3, 4, 4, 4, 4], [1, 2, 3, 4]).

test(compress_with_lists, all(L = [1])) :-
	compress([1, 2, [2], [2], 2, 3, [3, [3, [3]]], [3, [3, [3]]], 3],
    [1, 2, [2], 2, 3, [3, [3, [3]]], 3]).

:- end tests(tests)
