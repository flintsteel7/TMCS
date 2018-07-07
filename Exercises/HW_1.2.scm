(define (square x)
  (* x x))

(define (squarel x)
  (list (square x))
)

(define (squares lst)
  (if (eq? (rest lst) '())
    (squarel (first lst))
    (append
      (squarel (first lst))
      (squares (rest lst))
    )
  )
)