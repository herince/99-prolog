% :- [p4_length]. - was redefining module plunit_tests, todo - fix (?)

% todo - remove and import from p4_length
len([], 0).
len([_|XS], L) :-
	len(XS, PrevL),
	L is PrevL + 1.

pack([], []).
pack([X], [[X]]).
pack([X, Y|Xs], [[X|Ys]|Zs]) :- X \= Y, len(Ys, N), N =:= 0, pack([Y|Xs], Zs).
pack([X, X|Xs], [[X|Ys]|Zs]) :- len(Ys, N), N =\= 0, pack([X|Xs], [Ys|Zs]).

:- begin_tests(tests).

% todo: fix test warnings

test(pack_empty) :-
	pack([], []).

test(pack_packed, all(L = [1])) :-
	pack([[1], [2, 2], [3, 3, 3]],
        [[[1]], [[2, 2]], [[3, 3, 3]]]).

test(pack_simple, all(L = [1])) :-
	pack([1, 2, 2, 3, 3, 3, 4, 4, 4, 4],
        [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]).

test(pack_mixed, all(L = [1])) :-
	pack([1, 2, 2, 3, 4, 4, 4, 4],
        [[1], [2, 2], [3], [4, 4, 4, 4]]).

test(pack_with_lists, all(L = [1])) :-
	pack([1, 2, [2], [2], 2, 3, [3, [3, [3]]], [3, [3, [3]]], 3],
        [[1], [2], [[2], [2]], [2], [3], [[3, [3, [3]]], [3, [3, [3]]]], [3]]).

:- end tests(tests)
