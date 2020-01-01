is_flat([]).
is_flat([X]) :- not(is_list(X)).
is_flat([H | T]) :- not(is_list(H)), is_flat(T).

my_flatten(L, L) :- is_flat(L).
my_flatten(L, F) :- append(H, M, L)
					, append([E], T, M)
					, my_flatten(H, FH)
					, my_flatten(T, FT)
					, my_flatten(E, FE)
					, append(FH, FE, FFH)
					, append(FFH, FT, F).

:- begin_tests(tests).

% todo: fix tests

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
