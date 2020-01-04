len([], 0).
len([_|XS], N1) :- len(XS, N), N1 is N + 1.

split([], _, [], []).
split(X, 0, [], X) :- len(X, N), N > 0.
split([X|Xs], N, [X|L1s], L2) :- N > 0, I is N - 1, split(Xs, I, L1s, L2).

:- begin_tests(tests).

test(split_empty, all([L1, L2] == [[[], []]])) :-
	split([], 3, L1, L2).

test(split_zero, all([L1, L2] == [[[], [1, 2, 3, 4, 5]]])) :-
	split([1, 2, 3, 4, 5], 0, L1, L2).

test(split_to_size, all([L1, L2] == [[[1, 2, 3, 4, 5], []]])) :-
	split([1, 2, 3, 4, 5], 5, L1, L2).

test(split_sample_test, all([L1, L2] == [[[a,b,c], [d, e, f, g, h, i, k]]])) :-
	split([a, b, c, d, e, f, g, h, i, k], 3, L1, L2).

:- end_tests(tests).
