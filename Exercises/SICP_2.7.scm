; interval constructor:
(define (make-interval a b) (cons a b))

; selectors for upper-bound and lower-bound
(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))