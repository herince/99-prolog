drop_helper([], _, _, []).
drop_helper([_], N, 0, []) :- N > 0.
drop_helper([_, X|Xs], N, 0, [X|Ys]) :- I is N-1
                                        , drop_helper([X|Xs], N, I, [X|Ys]).
drop_helper([X|Xs], N, I, [X|Ys]) :- I > 0
                                     , I1 is I - 1
                                     , drop_helper(Xs, N, I1, Ys).

drop(L, 0, L).
drop(L, N, X) :- N > 0, I is N-1, drop_helper(L, N, I, X).

:- begin_tests(tests).

test(drop_empty) :-
	drop([], 2, []).

test(drop_zeroth, all(X = [[1, 2, 3, 4, 5]])) :-
	drop([1, 2, 3, 4, 5], 0, X).

test(drop_sample_test, all(X = [[a, b, d, e, g, h, k]])) :-
	drop([a, b, c, d, e, f, g, h, i, k], 3, X).

test(drop_last, all(X = [[a, b, d, e]])) :-
	drop([a, b, c, d, e, f], 3, X).

:- end_tests(tests).
