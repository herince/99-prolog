dupli([], []).
dupli([X|Xs], [X, X|Ys]) :- dupli(Xs, Ys).

:- begin_tests(tests).

test(dupli_empty) :-
	dupli([], []).

test(dupli_simple, all(X = [[1, 1, 2, 2, 3, 3, 4, 4, 5, 5]])) :-
	dupli([1, 2, 3, 4, 5], X).

test(dupli_duplicating, all(X = [[1, 1, 2, 2, 2, 2, 2, 2, 3, 3]])) :-
	dupli([1, 2, 2, 2, 3], X).

:- end_tests(tests).
