pack([], []).
pack([X], [[X]]).
pack([X, Y|Xs], [[X]|Zs]) :- X \= Y, pack([Y|Xs], Zs).
pack([X, X|Xs], [[X|Ys]|Zs]) :- pack([X|Xs], [Ys|Zs]).

:- begin_tests(tests).

% todo: fix tests

test(pack_empty) :-
	pack([], []).

test(pack_packed, all(X = [[[[1]], [[2, 2]], [[3, 3, 3]]]])) :-
	pack([[1], [2, 2], [3, 3, 3]], X).

test(pack_simple, all(X = [[[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]])) :-
	pack([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], X).

test(pack_mixed, all(X = [[[1], [2, 2], [3], [4, 4, 4, 4]]])) :-
	pack([1, 2, 2, 3, 4, 4, 4, 4], X).

test(pack_with_lists, all(X = [[[1], [2], [[2], [2]], [2], [3], [[3, [3, [3]]], [3, [3, [3]]]], [3]]])) :-
	pack([1, 2, [2], [2], 2, 3, [3, [3, [3]]], [3, [3, [3]]], 3], X).

:- end_tests(tests).
