(define (cont-frac n d k)
  (define (cf-iter n d k acc)
    (if (= k 0)
        acc
        (cf-iter n d (- k 1) (/ (n 1) (+ (d 1) acc)))))
  (cf-iter n d k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; How large must you make k in order to get an approximation
; of 1/golden-ratio that is accurate to 4 decimal places?

; 11