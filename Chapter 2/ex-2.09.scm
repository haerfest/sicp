(load "ex-2.08.scm")

(define (width x)
  (/ (- (upper-bound x)
        (lower-bound x))
     2))

;; Width under addition is a function the widths of the intervals being added:
;;
;; (width (add-interval (make-interval (lower-bound x) (upper-bound x))
;;                      (make-interval (lower-bound y) (upper-bound y))))
;; =
;; (width (make-interval (+ (lower-bound x) (lower-bound y))
;;                       (+ (upper-bound x) (upper-bound y))))
;; =
;; (/ (- (+ (upper-bound x) (upper-bound y))
;;       (+ (lower-bound x) (lower-bound y)))
;;    2)
;; =
;; (/ (+ (- (upper-bound x) (lower-bound x))
;;       (- (upper-bound y) (lower-bound y)))
;;    2)
;; =
;; (+ (/ (- (upper-bound x) (lower-bound x)) 2)
;;    (/ (- (upper-bound y) (lower-bound y)) 2))
;; =
;; (+ (width x) (width y))

;; Not so under multiplication:

;; (define x1 (make-interval 0 2))
;; (define y1 (make-interval 2 4))

;; (define x2 (make-interval 10 12))
;; (define y2 (make-interval 20 22))

;; (width x1)
;; => 1
;; (width y1)
;; => 1
;; (width (mul-interval x1 y1))
;; => 4

;; (width x2)
;; => 1
;; (width y2)
;; => 1
;; (width (mul-interval x2 y2))
;; => 32

