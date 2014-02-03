;;;;; utils

(defun minusOne (L)
  (cond 
    ( (null L) NIL) 
    ( (cons (- (car L) 1) (minusOne (cdr L)) ) )
  )
)

; finds the difference between the first
; list and the second list
(defun diff (first second)
  (cond
    ( (null first) nil)
    ( (not (member (car first) second) ) (cons (car first) (diff (cdr first) second) ) )
    ( (diff (cdr first) second) )
  )
)

; Returns the item at an index
(defun at (L n)
  (cond
    ((null L) nil)
    ((= n 0) (car L))
    ((at (cdr L) (- n 1)))
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

; searches one list against another 
; and returns similar elements 
(defun similar (first second)
  (cond
    ( (null first) nil)
    ( (member (car first) second) (cons (car first) (similar (cdr first) second) ) )
    ( ( similar (cdr first) second) )
  )
)

; return a list of of elements
; that don't appear in either list
(defun different (first second)
  (append (diff first second) (diff second first) )
)

; Return the last item in a list
(defun last-item (L)
  (cond 
    ( (null (cdr L)) (car L) )
    ( (last-item (cdr L)) ) 
  )
)

; Puts all arguments in a list
(defun mcons (&rest L)
  (cond
    ( (null (cdr L)) (car L) )
    ( (cons (car L) (apply 'mcons (cdr L)) ) )
  )
)

(defun each-nth (L n)
  (cond
    ( (null L) nil)
    ( (cons (at (car L) n) (each-nth (cdr L) n)) )
  )
)