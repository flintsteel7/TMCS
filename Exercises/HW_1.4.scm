(define (ordered? numlst)
  (if [eq? (length numlst) 1]
    #t
    (cond [(< (first numlst) (first (rest numlst)))
        (ordered? (rest numlst))]
      [else #f]
    )
  )
)