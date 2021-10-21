(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (define (sign-correct-rat n d)
    (if (< d 0)
        (cons (- n) (- d))
        (cons n d)))
  (let ((g (gcd n d)))
    (sign-correct-rat (/ n g)
                      (/ d g))))

(define numer car)

(define denom cdr)

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))
