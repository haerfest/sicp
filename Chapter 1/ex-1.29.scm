(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (multiplier k)
      (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2)
            (else 4)))
    (define (y k)
      (f (+ a (* k h))))
    (define (sum k acc)
      (if (> k n)
          (* h 1/3 acc)
          (sum (+ k 1) (+ acc (* (multiplier k) (y k))))))
    (sum 0 0)))

(define (even? x)
  (= (remainder x 2) 0))

(define (cube x)
  (* x x x))

(simpson cube 0 1 100)   ; => 1/4
(simpson cube 0 1 1000)  ; => 1/4