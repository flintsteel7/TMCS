(define (eword wd)
  (if [eq? (last wd) 'e]
    (list wd)
    '()
  )
)

(define (ends-e snt)
  (if [eq? (length snt) 1]
    [eword snt]
    [append
      (eword (first snt))
      (ends-e (rest snt))
    ]
  )
)