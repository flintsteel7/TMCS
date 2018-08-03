(define (every fun sent)
  (if (eq? (rest sent) '())
    (list (fun (first sent)))
    (append
      (list (fun (first sent)))
      (every fun (rest sent)))))