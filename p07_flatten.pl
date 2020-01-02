is_flat([]).
is_flat([X|Xs]) :- not(is_list(X)), is_flat(Xs).

my_flatten([], []).
my_flatten([X|Xs], [X|Ys]) :- not(is_list(X)) , my_flatten(Xs, Ys).
my_flatten([X|Xs], F) :- is_list(X)
                        , my_flatten(X, FX)
                        , my_flatten(Xs, FXs)
                        , append(FX, FXs, F).

:- begin_tests(tests).

test(flatten_empty) :-
	my_flatten([], []).

test(flatten_flat, all(X = [[1, 2, 3]])) :-
	my_flatten([1, 2, 3], X).

test(flatten_simple, all(X = [[1, 2, 3]])) :-
	my_flatten([1, [2, 3]], X).

test(flatten_nested, all(X = [[1, 2, 3, 4, 5]])) :-
	my_flatten([1, [2, [3, [4, 5]]]], X).
	
test(flatten_complex, all(X = [[0, 1, 2, 3, 4, 5, 6, 7]])) :-
	my_flatten([[[0], 1], [2, 3, [4], [5, [6]]], 7], X).

:- end_tests(tests).
