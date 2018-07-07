(define (swapper wd)
  (cond [(eq? wd 'you) 'me]
    [(or (eq? wd 'i) (eq? wd 'me)) 'you]
    [else wd]
  )
)

(define (switch-iter snt)
  (if [eq? (length snt) 1]
    [list (swapper (first snt))]
    [append
      (list (swapper (first snt)))
      (switch-iter (rest snt))
    ]
  )
)

(define (switch snt)
  (cond [(eq? (first snt) 'you)
      (append '(i) (switch-iter (rest snt)))]
    [else (switch-iter (rest snt))]
  )
)