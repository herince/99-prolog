%len_helper([], Counter, Counter).
%len_helper([_|XS], Y, Counter) :-
	%NextCounter is Counter + 1,
	%len_helper(XS, Y, NextCounter).

%len(X, Y) :- len_helper(X, Y, 0).

len([], 0).
len([_|XS], N1) :- len(XS, N), N1 is N + 1.

:- begin_tests(tests).

test(len_empty, all(N == [0])) :-
        len([], N) .

test(len_one, all(N == [1])) :-
        len([42], N).

test(len_random, all(N == [37])) :-
		findall(X, between(1, 37, X), List),
        len(List, N).

:- end_tests(tests).
