(load "ex-2.18.scm")                    ; For reverse.

(define (same-parity pivot . numbers)
  (define (parity x) (remainder x 2))
  (let ((pivot-parity (parity pivot)))
    (define (inner numbers accumulator)
      (if (null? numbers)
          accumulator
          (let ((number (car numbers)))
            (if (= pivot-parity (parity number))
                (inner (cdr numbers) (cons number accumulator))
                (inner (cdr numbers) accumulator)))))
    (reverse (inner numbers (list pivot)))))

