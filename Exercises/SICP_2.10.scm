; handle division by an interval that spans zero

; original procedure:
(define (div-interval x y)
  (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

; handling zero spans in y
(define (spans-zero? x)
  (if (and (>= 0 (lower-bound x))
          (<= 0 (upper-bound x)))
    #t
    #f))

(define (div-interval x y)
  (if (not (spans-zero? y))
      (mul-interval x
                    (make-interval
                      (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))
      (error "cannot divide by an interval that spans zero")))