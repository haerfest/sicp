(load "ex-2.09.scm")

(define (div-interval x y)
  (if (= (width y) 0)
      (error "Division by zero for interval" y)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
