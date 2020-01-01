kth_element(1, [Y | YS], Y).
kth_element(X, [_ | YS], Z) :-
	Next is X - 1,
	kth_element(Next, YS, Z).

:- begin_tests(tests).

test(kth_element__first, all(Kth == [10])) :-
        kth_element(1, [10, 20, 30, 40, 50], Kth) .

test(kth_element__middle, all(Kth == [30])) :-
        kth_element(3, [10, 20, 30, 40, 50], Kth) .

test(kth_element__last, all(Kth == [50])) :-
        kth_element(5, [10, 20, 30, 40, 50], Kth) .
        
test(kth_element__index_out_of_bounds, fail) :-
        kth_element(5, [], _) .

:- end_tests(tests).