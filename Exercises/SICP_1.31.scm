; recursive version
(define (product fun start next stop)
  (if (equal? start stop)
    (fun stop)
    (* (fun start) (product fun (next start) next stop))
  )
)

; iterative version
(define (product fun start next stop)
  (define (iter str stp result)
    (if (equal? str stp)
      result
      (iter (next str) stp (* result (fun str)))
    )
  )
  (iter start stop 1)
)

; use product to calc factorial
(define (factorial x)
  (product (lambda (x) x) x (lambda (x) (- x 1)) 1))

; use product to approximate pi
(define (approx_pi times)
  (*
    (product
      (lambda (n)
        (* (/ (* 2 n) (- (* 2 n) 1))
          (/ (* 2 n) (+ (* 2 n) 1)))
      )
      1
      (lambda (x) (+ x 1))
      times)
    2)
)