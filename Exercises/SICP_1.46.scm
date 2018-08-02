(define (iterative-improve good-enough? improve)
  (define (iter result)
    (if (good-enough? result (improve result))
      result
      (iter (improve result))))
  (lambda (guess) (iter guess)))

; rewrite sqrt procedure of 1.1.7 in terms of iterative-improve
(define (sqrt x)
  (define (good-enough? guess next_guess)
    (< (abs (- guess next_guess)) 0.00001))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  ((iterative-improve
    good-enough?
    improve) 1.0))

; rewrite fixed-point procedure of 1.3.3 in terms of iterative-improve
(define (fixed-point fun first-guess)
  (define (good-enough? guess next_guess)
    (< (abs (- guess next_guess))
      0.00001))
  (define (try guess)
    (let ((next (fun guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  ((iterative-improve
    good-enough?
    try) first-guess))