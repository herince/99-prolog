last_element(X, [X ]) .
last_element(X, [_ | L]) :- last_element(X, L) .

:- begin_tests(tests).

test(last_element__simple, all(Last == [3])) :-
        last_element(Last, [1, 2, 3]) .

test(last_element__one_element, all(Last == [4])) :-
        last_element(Last, [4]) .
        
test(last_element__empty_list, fail) :-
        last_element(_, []) .

:- end_tests(tests).
