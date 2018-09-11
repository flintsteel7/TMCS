; center from exercise 2.11
(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

; Define a constructor make-center-percent that takes
; a cernter and a percentage tolerance and produces
; the desired interval

(define (make-center-percent center percentage)
  (make-interval
    (- center (* center percentage))
    (+ center (* center percentage))))

; You must also define a selector percent that produces
; the percentage tolerance for a given interval

(define (percent interval)
 (/ (- (upper-bound interval) (center interval)) (center interval)))