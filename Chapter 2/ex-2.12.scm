(load "ex-2.11.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (/ (* p c) 100)))
    (make-interval (- c w) (+ c w))))

(define (percent i)
  (/ (* 100 (width i)) (center i)))
