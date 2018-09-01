; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt.
(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
  (not (= (remainder n 2) 0)))

; My attempt
; this took me almost 5 hours to get working...
; and it only works with exponents up to 9 :-(
(define (expt base exp)
  (define (expt-iter a b n)
    (cond ((= a n 1)
           b)
          ((and (= n 1) (odd? exp))
           (* a b))
          ((and (= n 1) (even? exp))
           a)
          ((and (even? n) (= a 1))
           (expt-iter (* a (square b)) b (/ n 2)))
          ((even? n)
           (expt-iter (square a) b (/ n 2)))
          (else
           (expt-iter (* a b) b (- n 1)))))
  (expt-iter 1 base exp))
