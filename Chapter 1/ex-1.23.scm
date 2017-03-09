; Testing algorithm has order of growth O(sqrt(n)), so input size x 10 should
; give a run time x sqrt(10) = 3.2  Does that hold?
;
; Skipping irrelevant output:
;
; > (timed-prime-test 1009)
; 1009 *** 14
; > (timed-prime-test 1013)
; 1013 *** 15
; > (timed-prime-test 1019)
; 1019 *** 13
;
; So the base run time is 14.
;
; > (timed-prime-test 10007)
; 10007 *** 27
; > (timed-prime-test 10009)
; 10009 *** 26
; > (timed-prime-test 10037)
; 10037 *** 23
;
; Input size x 10, run time x 1.8.
;
; > (timed-prime-test 100003)
; 100003 *** 69
; > (timed-prime-test 100019)
; 100019 *** 68
; > (timed-prime-test 100043)
; 100043 *** 68
;
; Input size x 10, run time x 2.7.
;
; > (timed-prime-test 1000003)
; 1000003 *** 186
; > (timed-prime-test 1000033)
; 1000033 *** 168
; > (timed-prime-test 1000037)
; 1000037 *** 199
;
; Input size x 10, run time x 2.7.
;
; So the previous algorithm, where (next test-divisor) would always be next
; integer, i.e. (+ test-divisor 1), ran in O(sqrt(n)) which means that when the
; input size is multiplied by 10, the run time is multiplied by roughly 3.2.
;
; This version, where (next test-divisor) ensures that all the even test
; divisors except two are skipped, is not twice as fast (x 3.2/2 = 1.6).  It
; appears to be only about 15% faster (x 3.2 -> x 2.7).
;
; I would conclude that we did indeed divide the number of steps to execute by
; two, but also that we made each step more expensive (by calling next, instead
; of always simply performing +1).  Therefore the net gain is only 15%, and not
; 100%.

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
        (else (find-divisor n (next test-divisor)))))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ 2 test-divisor)))