(define (double fun)
  (lambda (func) (fun (fun func))))