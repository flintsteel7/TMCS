(define (proc a b c)
  (cond ((and (> a b) (> b c)) (+ (* a a) (* b b)))
        ((and (< a b) (< b c)) (+ (* b b) (* c c)))
        ((and (> a b) (< b c)) (+ (* a a) (* c c)))))