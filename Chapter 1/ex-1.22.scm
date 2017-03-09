; Testing algorithm has order of growth O(sqrt(n)), so input size x 10 should
; give a run time x sqrt(10) = 3.2  Does that hold?
;
; Skipping irrelevant output:
;
; > (search-for-primes 1000)
; 1009 *** 9
; 1013 *** 9
; 1019 *** 9
;
; > (search-for-primes 10000)  ; 
; 10007 *** 29
; 10009 *** 29
; 10037 *** 29
;
; Input size from 1,000 to 10,000 (10x).
; Expected runtime = 9 x sqrt(10) = 29.  Check!
;
; > (search-for-primes 100000)
; 100003 *** 104
; 100019 *** 105
; 100043 *** 87
;
; Input size from 10,000 to 100,000 (10x).
; Expected runtime = 29 x sqrt(10) = 92.  Close enough!
;
; > (search-for-primes 1000000)
; 1000003 *** 329
; 1000033 *** 279
; 1000037 *** 275
;
; Input size from 100,000 to 1,000,000 (10x).
; Expected runtime = 92 x sqrt(10) = 290.  Close enough!
;
; So yes, the data does support the expected order of growth of O(sqrt(n)).
; Individual results vary slightly, but overall they hold op.  Programs on my
; machine do run in time proportional to the number of steps required.

(define (search-for-primes lower-threshold)
  (define (search n count)
    (if (> count 0)
        (if (timed-prime-test n)
            (search (+ n 2) (- count 1))
            (search (+ n 2) count))))
  (if (even? lower-threshold)
      (search (+ lower-threshold 1) 3)
      (search lower-threshold 3)))

(define (even? x)
  (= (remainder x 2) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))