(define (euler_expand k)
  (define (cf-iter k acc osc inc)
    (cond ((= k 0)
            acc)
          ((= osc 1)
            (cf-iter (- k 1) (/ 1 (+ 1 acc)) (+ osc 1) (+ inc 2)))
          ((= osc 2)
            (cf-iter (- k 1) (/ 1 (+ inc acc)) (+ osc 1) inc))
          ((= osc 3)
            (cf-iter (- k 1) (/ 1 (+ 1 acc)) (- osc 2) inc))))
  (cf-iter k 0 1 0))