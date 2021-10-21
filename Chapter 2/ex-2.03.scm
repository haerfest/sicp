(define (make-point x y)
  (cons x y))

(define x car)
(define y cdr)

(define (perimeter r)
  (+ (* 2 (width r))
     (* 2 (height r))))

(define (area r)
  (* (width r) (height r)))

;; First implementation:

;; (define (make-rect tl br)
;;   (cons tl br))

;; (define top-left car)
;; (define bottom-right cdr)

;; (define (width r)
;;   (- (x (bottom-right r))
;;      (x (top-left r))))

;; (define (height r)
;;   (- (y (top-left r))
;;      (y (bottom-right r))))

;; (perimeter (make-rect (make-point 0 3) (make-point 5 1)))
;; => 14
;; (area (make-rect (make-point 0 3) (make-point 5 1)))
;; => 10

;; Second implementation:
(define (make-rect tl w h)
  (cons tl (cons w h)))

(define width cadr)
(define height cddr)

;; (perimeter (make-rect (make-point 0 1) 5 2))
;; => 14
;; (area (make-rect (make-point 0 1) 5 2))
;; => 10
