;;;;; utils

(defun minusOne (L)
  (cond 
    ( (null L) NIL) 
    ( (cons (- (car L) 1) (minusOne (cdr L)) ) )
  )
)

; takes the first n of a list 
(defun take (L n)
  (cond
    ( (null L) NIL )
    ( (<= n 0) NIL )
    ( (cons (car L) (take (cdr L) (- n 1)) ) )
  )
)

;;;;;

; deleteAt removes an element from `L` 
; at a specific 0-based index
(defun deleteAt (L index)
  (cond 
    ( (null L) NIL )
    ( (eq index 0) (cdr L) )
    ; construct new element with current value and recurse
    ( (cons (car L) (deleteAt (cdr L) (- index 1))) )
  )
)

; deletes all elements given 
; in `indexes` from `L`
(defun deleteAllAt (L &rest indexes)
  (cond
    ( (null indexes) L)
    ( (apply 'deleteAllAt (deleteAt L (car indexes)) (minusOne (cdr indexes))) ) 
  ) 
)


; sums up all arguments
(defun sumAll (&rest args)
  (cond
    ( (null args) 0 )
    ( (atom (car args)) (+ (car args) (apply 'sumAll (cdr args)) ) )
    ( (+ (eval (car args)) (apply 'sumAll (cdr args)) ) )
  )
)

; searches one list agains another 
; and returns similar elements 
(defun similar (first second)
  (cond
    ( (null first) nil)
    ( (null second) (similar (cdr first) second) )
    ;( (equal (car first) (car second)) (car second) )
    ( (similar first (cdr second)) )
  )
)

(defun alone (first second)
)

(defun last-item (L)
)