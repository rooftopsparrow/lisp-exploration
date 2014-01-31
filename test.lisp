(load "lib/lisp-unit") ; use lisp-unit framework
(in-package :lisp-unit)

(load "functions")

; (define-test test-take
;     (assert-equal '("a" "b") (take '("a" "b" "c" "d") 2))
;     (assert-equal nil (take '("a" "b" "c" "d") 0))
;     (assert-equal nil (take '() 4))
; )

(define-test test-minusOne
    (assert-equal '(0 1 2 3) (minusOne '(1 2 3 4)) )
    (assert-equal '() (minusOne '()) )
)

(define-test test-deleteAt
    (assert-equal '(1 2 4 5) (deleteAt '(1 2 3 4 5) 2)) 
    (assert-equal '(2 3 4 5) (deleteAt '(1 2 3 4 5) 0))
    (assert-equal '(1 2 3 4 5) (deleteAt '(1 2 3 4 5) 6))
    (assert-equal '(1 2 3 4 5) (deleteAt '(1 2 3 4 5) -1))
    (assert-equal '(A B C E) (deleteAt '(A B C D E) 3)) ; From hw
)

(define-test test-deleteAllAt
    (assert-equal '(1 2 3 4 5 6) (deleteAllAt '(1 2 3 4 5 6) 6))
    (assert-equal '(1 2 3 4 5 6) (deleteAllAt '(1 2 3 4 5 6) -1))
    (assert-equal '(2 3 4 5 6) (deleteAllAt '(1 2 3 4 5 6) 0))
    (assert-equal '(1 3 5) (deleteAllAt '(1 2 3 4 5 6) 1 3 5))
    (assert-equal '(C E) (deleteAllAt '(A B C D E) 0 1 3)) ; from hw
)

(define-test test-sumAll
    (assert-equal 15 (sumAll 1 2 3 4 5))
    (assert-equal 0 (sumAll))
    (assert-equal 13 (sumAll '(/ 8 4) '(+ 5 6) ))
    (assert-equal 39 (sumAll 3 4 '(* 5 6) 2)) ; from hw
)

(define-test test-similar
    (assert-equal '(1) (similar '(5 3 1) '(2 1 3)) )
    ;(assert-equal '(B) (similar '(A B C D E) '(X (A C) B R L)) ) ; from hw
)

(define-test test-alone
    (assert-equal '(A C D E X (A C) R L) (alone '(A B C D E) '( X (A C) B R L)) ) ; from hw
)

(define-test test-last-item
    (assert-equal "G" (last-item '("A" "B" "T" "G")) )
)

(setq *print-errors* T)
(setq *print-failures* T)
(run-tests :all)
