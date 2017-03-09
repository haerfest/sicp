; Testing algorithm has order of growth O(log(n)), so input size x 10 should
; give a run time x log{n}(10).  Does that hold?
;
; Skipping irrelevant output:
;
; > (timed-prime-test 1009)
; 1009 *** 34
; > (timed-prime-test 1013)
; 1013 *** 36
; > (timed-prime-test 1019)
; 1019 *** 32
;
; So the base run time is 34.
;
; > (timed-prime-test 10007)
; 10007 *** 43
; > (timed-prime-test 10009)
; 10009 *** 41
; > (timed-prime-test 10037)
; 10037 *** 46;
;
; Input size from 1,000 to 10,000 (10x).
; Runtime from 34 to 43.3 on average, or only 1.3x.
;
; > (timed-prime-test 100003)
; 100003 *** 51
; >  (timed-prime-test 100019)
; 100019 *** 51
; > (timed-prime-test 100043)
; 100043 *** 54
;
; Input size from 10,000 to 100,000 (10x).
; Runtime from 43.3 to 52 on average, or only 1.2x.
;
; > (timed-prime-test 1000003)
; 1000003 *** 56
; > (timed-prime-test 1000033)
; 1000033 *** 53
; > (timed-prime-test 1000037)
; 1000037 *** 54
;
; Input size from 100,000 to 1,000,000 (10x).
; Runtime from 52 to 54.3 on average, or only 1.05x.
;
; Primes near 1,000,000 are a factor 1,000x larger than those near 1,000.
; The time needed for the tests should be log{n}(1,000) more, for some value
; of n.  Log{10} would give a factor 3x increase, log{200} would give a 1.3x
; increase.  We seem to be doing even better than that at times:
;
;   1,000 ->    10,000 (10x): run time 1.3x  = log{200}
;  10,000 ->   100,000 (10x): run time 1.2x  = log{310}
; 100,000 -> 1,000,000 (10x): run time 1.05x = log{700}

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 3)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (even? x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))