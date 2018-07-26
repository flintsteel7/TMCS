(define (repeated fun n)
  (define (iter str stp result)
    (if (< str stp)
      result
      (iter (+ str 1) stp (compose result fun))))
  (iter 1 n (compose fun fun)))

; 'compose' from 1.42, used in 'repeated' above
(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))