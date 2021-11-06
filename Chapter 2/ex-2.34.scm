(load "ex-2.33.scm")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

;; x^5 + 5x^3 + 3x + 1
;; =
;; 1x^5 + 0x^4 + 5x^3 + 0x^2 + 3x^1 + 1x^0
;; =
;; (((((1x + 5)x + 0)x + 5)x + 0)x + 3)x + 1
;; =
;; 1 + x(3 + x(0 + x(5 + x(0 + x(5 + 1x)))))
;; =
;; 1 + 3x + 5x^3 + 1x^5
(horner-eval 2 (list 1 3 0 5 0 1))
