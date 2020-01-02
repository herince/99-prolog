is_flat([]).
is_flat([X|Xs]) :- not(is_list(X)), is_flat(Xs).

my_flatten(L, L) :- is_flat(L).
my_flatten([X|Xs], [X | Ys]) :- not(is_list(X)) , my_flatten(Xs, Ys).
my_flatten([X|Xs], F) :- is_list(X)
                        , my_flatten(X, FX)
                        , my_flatten(Xs, FXs)
                        , append(FX, FXs, F).

:- begin_tests(tests).

% todo: fix tests or maybe flatten logic(?)

test(flatten_empty) :-
	my_flatten([], []).

test(flatten_flat) :-
	my_flatten([1, 2, 3], [1, 2, 3]).

test(flatten_simple) :-
	my_flatten([1, [2, 3]], [1, 2, 3]).

test(flatten_nested) :-
	my_flatten([1, [2, [3, [4, 5]]]], [1, 2, 3, 4, 5]).
	
test(flatten_complex) :-
	my_flatten([[[0], 1], [2, 3, [4], [5, [6]]], 7],
				[0, 1, 2, 3, 4, 5, 6, 7]).

:- end tests(tests)
