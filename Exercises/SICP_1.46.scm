(define (iterative-improve good-enough? improve target)
  (define (iter result)
    (if (good-enough? result target)
      result
      (iter (improve result target))))
  (lambda (guess) (iter guess)))

; rewrite sqrt procedure of 1.1.7 in terms of iterative-improve
(define (sqrt x)
  (define (good-enough? guess target)
    (< (abs (- (* guess guess) target)) 0.001))
  (define (improve guess target)
    (/ (+ guess (/ target guess)) 2))
  ((iterative-improve
    good-enough?
    improve
    x) 1.0))