%len_helper([], Counter, Counter).
%len_helper([_|XS], Y, Counter) :-
	%NextCounter is Counter + 1,
	%len_helper(XS, Y, NextCounter).

%len(X, Y) :- len_helper(X, Y, 0).

len([], 0).
len([_|XS], L) :-
	len(XS, PrevL),
	L is PrevL + 1.

:- begin_tests(tests).

test(len_empty, all(L == [0])) :-
        len([], L) .

test(len_one, all(L == [1])) :-
        len([42], L) .

test(len_random, all(L == [37])) :-
		findall(N, between(1, 37, N), List),
        len(List, L).

:- end_tests(tests).