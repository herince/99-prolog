my_reverse([], []).
my_reverse(X, [Y|YS]) :-
	append(PrevX, [Z], X),
	append([Z], _, [Y|YS]),
	my_reverse(PrevX, YS).

:- begin_tests(tests).

test(reverse_empty, all(Y == [[]])) :-
    my_reverse([], Y) .

test(reverse_one, all(Y == [[4]])) :-
    my_reverse([4], Y) .

test(reverse_simple, all(R == [[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]])) :-
	findall(N, between(1, 10, N), List)
	, my_reverse(List, R).

test(reverse_reverse, all(RR == [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]])) :-
    findall(N, between(1, 10, N), List)
    , my_reverse(List, R)
    , my_reverse(R, RR).

:- end_tests(tests).
