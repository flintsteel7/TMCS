; iterative version
(define (accumulate combiner null-value term a next b)
  (define (iter a b result)
    (if (> a b)
      result
      (iter (next a) b (combiner result (term a)))
    )
  )
  (iter a b null-value)
)

; sum using accumulate
(define (sum term a next b)
  (accumulate
    (lambda (a b) (+ a b))
    0
    term a next b
  )
)

; test sum with sum-integers
(define (sum-integers a b)
  (sum
    (lambda (x) x)
    a
    (lambda (x) (+ x 1))
    b
  )
)

; product using accumulate
(define (product term a next b)
  (accumulate
    (lambda (a b) (* a b))
    1
    term a next b
  )
)

; test product with factorial
(define (factorial x)
  (product
    (lambda (x) x)
    1
    (lambda (x) (+ x 1))
    x
  )
)