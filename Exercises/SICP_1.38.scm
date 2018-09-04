; this is my solution:
(define (euler-expand k)
  (define (cf-iter k acc osc inc)
    (cond ((= k 0)
            (* 1.0 (+ acc 2)))
          ((= osc 1)
            (cf-iter (- k 1) (/ 1 (+ 1 acc)) (+ osc 1) (+ inc 2)))
          ((= osc 2)
            (cf-iter (- k 1) (/ 1 (+ inc acc)) (+ osc 1) inc))
          ((= osc 3)
            (cf-iter (- k 1) (/ 1 (+ 1 acc)) (- osc 2) inc))))
  (cf-iter k 0 1 0))
; which doesn't use cont-frac from 1.37
; and isn't a very accurate

; Here's a correct solution, which uses cont-frac:
(define (e-euler k)
  (+ 2.0 (cont-frac (lambda (i) 1)
                    (lambda (i)
                      (if (= (remainder i 3) 2)
                          (/ (+ i 1) 1.5)
                          1))
                    k)))