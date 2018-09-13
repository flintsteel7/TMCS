; Give an implementation of `for-each`
(define (for-each fun lst)
  (fun (car lst))
  (if (null? (cdr lst))
      :okay
      (for-each fun (cdr lst))))