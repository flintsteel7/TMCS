; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt.
(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

; My attempt
(define (expt b n)
  (define (expt-iter b1 n1)
    (cond ((= n1 1)
           b1)
          ((even? n1)
           (expt-iter (square b1) (/ n1 2)))
          (else
           (expt-iter (* b (square b1)) (/ (- n1 1) 2)))))
  (expt-iter b n))