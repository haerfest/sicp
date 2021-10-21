(define (make-point x y)
  (cons x y))

(define x-point car)

(define y-point cdr)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment p1 p2)
  (cons p1 p2))

(define start-segment car)

(define end-segment cdr)

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment s)
  (let ((p1 (start-segment s))
        (p2 (end-segment s)))
    (make-point (average (x-point p1) (x-point p2))
                (average (y-point p1) (y-point p2)))))
