%decode([], []).
%decode([E|Xs], [E|Ys]) :- not(is_list(E)), decode(Xs, Ys).
%decode([[1, E]|Xs], [E|Ys]) :- decode(Xs, Ys).
%decode([[N1, E]|Xs], [E|Ys]) :- N1 > 1, N is N1 - 1, decode([[N, E]|Xs], Ys).

decode([], []).
decode([E|Xs], [E|Ys]) :- not(is_list(E)), decode(Xs, Ys).
decode([[2, E]|Xs], [E|Ys]) :- not(is_list(E)), decode([E|Xs], Ys).
decode([[N1, E]|Xs], [E|Ys]) :- N1 > 2, N is N1 - 1, decode([[N, E]|Xs], Ys).


:- begin_tests(tests).

test(decode_empty) :-
	decode([], []).

test(decode_singles, all(X = [[1, 2, 3, 4, 5]])) :-
	decode([1, 2, 3, 4, 5], X).

test(decode_duplicates, all(X = [[1, 1, 2, 2, 2, 3, 3, 3, 3]])) :-
	decode([[2, 1], [3, 2], [4, 3]], X).

test(decode_mixed, all(X = [[1, 2, 2, 3, 4, 4, 4, 4]])) :-
	decode([1, [2, 2], 3, [4, 4]], X).

:- end_tests(tests).
