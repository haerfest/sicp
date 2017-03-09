; The difference between both implementations is that expmod-1 applies the
; remainder function at every step, limiting the numbers to be calculated with
; to the [0..m) range.  The expmod-2 only applies the remainder operation all
; the way at the end, meaning it might have had to calculate with some very
; large numbers.  Such numbers may perhaps not fit in the native register size,
; meaning it cannot do native multiplication and has to resort to more expensive
; library calls.
;
; The run time measurements seem to support this:
;
; > (time expmod-1)
; 21
; > (time expmod-2)
; 738491

(define (expmod-1 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod-1 base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod-1 base (- exp 1) m))
                    m))))

(define (expmod-2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (square (fast-expt base (/ exp 2))))
        (else (* base (fast-expt base (- exp 1))))))

(define (square x) (* x x))
(define (even? x) (= (remainder x 2) 0))

(define (time expmod)
  (let ((start-time (runtime)))
    (expmod 1000000 1000037 1000037)
    (- (runtime) start-time)))