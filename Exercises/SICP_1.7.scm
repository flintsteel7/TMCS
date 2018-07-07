(define (good-enough? guess last-guess)
  (< (/ (abs (- guess last-guess)) guess) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess)
    guess
    (sqrt-iter (improve guess x) guess x)
  )
)

(define (sqrt x)
  (sqrt-iter 1.0 0.5 x))