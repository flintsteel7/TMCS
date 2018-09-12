; Write a procedure same-parity that takes one or more integers
; and returns a list of all the arguments that have the same
; even-odd parity as the first argument

(define (parity n . l)
  (let ((eve (even? n)))
    (define (parity-iter lst res)
      (cond ((null? lst)
              res)
            ((or
                (and eve (even? (car lst)))
                (and (not eve) (not (even? (car lst)))))
              (parity-iter (cdr lst) (append res (list (car lst)))))
            (else
              (parity-iter (cdr lst) res))))
    (parity-iter l '())))