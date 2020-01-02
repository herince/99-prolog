my_repeat(_, 0, []).
my_repeat(X, N1, [X|Xs]) :- N1 > 0, N is N1 - 1, my_repeat(X, N, Xs).

dupli([], _, []).
dupli([X|Xs], N, R) :- my_repeat(X, N, XR)
                       , dupli(Xs, N, TR)
                       , append(XR, TR, R).

:- begin_tests(tests).

test(dupli_empty) :-
	dupli([], 2, []).

test(dupli_zero, all(X = [[]])) :-
	dupli([1, 2, 3], 0, X).

test(dupli_one, all(X = [[1, 2, 3]])) :-
	dupli([1, 2, 3], 1, X).

test(dupli_simple, all(X = [[1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4]])) :-
	dupli([1, 2, 3, 4], 3, X).

test(dupli_duplicating, all(X = [[1, 1, 2, 2, 2, 2, 2, 2, 3, 3]])) :-
	dupli([1, 2, 2, 2, 3], 2, X).

:- end_tests(tests).
