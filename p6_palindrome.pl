%palindrome(X) :- reverse(X, X).

palindrome([]).
palindrome([_]).
palindrome([X|XS]) :-
	append(L, [Last], XS),
	(X = Last),
	palindrome(L).

:- begin_tests(tests).

test(palindrome_empty) :-
        palindrome([]) .

test(palindrome_odd, nondet) :-
        palindrome([1, 2, 3, 2, 1]) .

test(palindrome_even, nondet) :-
        palindrome([1, 2, 2, 1]).

test(palindrome_no_palindrome, fail) :-
	findall(N, between(1, 10, N), List),
        palindrome(List).

:- end_tests(tests).
