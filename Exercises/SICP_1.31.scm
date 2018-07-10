; recursive version
(define (product fun start next stop)
  (if (equal? start stop)
    (fun stop)
    (* (fun start) (product fun (next start) next stop))
  )
)

; TODO iterative version

; use product to calc factorial
(define (factorial x)
  (product (lambda (x) x) x (lambda (x) (- x 1)) 1))

; TODO use product to approximate pi