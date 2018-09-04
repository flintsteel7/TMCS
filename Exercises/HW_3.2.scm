; write a procedure (next-perf n) that test numbers
; starting with n and continuing with n+1, n_2, etc.
; until a perfect number is found

; a factors function I got off Rosetta Code (https://rosettacode.org/wiki/Factors_of_an_integer#Scheme)
(define (factors n)
  (define (*factors d)
    (cond ((> d n) (list))
          ((= (modulo n d) 0) (cons d (*factors (+ d 1))))
          (else (*factors (+ d 1)))))
  (*factors 1))

; a factor-sum procedure
(define (factor-sum list)
  (define (fact-sum-iter sum lst)
    (if (eq? (rest lst) '())
      sum
      (fact-sum-iter (+ sum (first lst)) (rest lst))))
  (fact-sum-iter 0 list))

; the requested procedure
(define (next-perf n)
  (define (perf-iter num sum-facts)
    (if (eq? num sum-facts)
        num
        (perf-iter (+ num 1) (factor-sum (factors (+ num 1))))))
  (perf-iter n (factor-sum (factors n))))

; the next pefect number after 28 is 496