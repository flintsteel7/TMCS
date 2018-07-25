(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a b result)
    (cond
      ((> a b) result)
      ((and (<= a b) (filter a)) (iter (next a) b (combiner result (term a))))
      (else (iter (next a) b result))))
  (iter a b null-value))

; the sum of the squares of the prime numbers in the interval a to b using filtered-accumulate
(define (sum-prime-squares a b)
  (filtered-accumulate
    (lambda (x y) (+ x y))
    0
    (lambda (x) (* x x))
    a
    (lambda (x) (+ x 1))
    b
    prime?))


; the product of all the positive integers less than n that are relatively prime to n
(define (prod-rel-primes n)
  (filtered-accumulate
    (lambda (x y) (* x y))
    1
    (lambda (x) x)
    1
    (lambda (x) (+ x 1))
    n
    (lambda (x) (= (gcd x n) 1))))



; prime number predicate function copied from stack overflow
(define (prime? n)
  (define (F n i) "helper"
    (cond ((< n (* i i)) #t)
          ((zero? (remainder n i)) #f)
          (else
           (F n (+ i 1)))))
 "primality test"
 (cond ((< n 2) #f)
     (else
      (F n 2))))

; GCD function copied from stack overflow
(define (gcd a b)
  (cond [(= b 0) a]
        [else (gcd b (modulo a b))]))