; interval subtraction procedure

(define (sub-interval x y)
  (make-interval (- (upper-bound x)
                    (upper-bound y))
                 (- (lower-bound x)
                    (lower-bound y)))