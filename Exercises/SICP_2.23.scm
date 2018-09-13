; Give an implementation of `for-each`
(define (for-each fun lst)
  (cond ((null? lst)
      :okay)
      (else (for-each fun (cdr lst))
            (fun (car lst)))))