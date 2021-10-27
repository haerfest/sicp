(load "ex-2.10.scm")

;; Look at sign of endpoints
;; Nine cases, restricted by (<= (lower-bound) (upper-bound))
;; Only one needs more than two multiplications
;; The other eight need two

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond
     ((and (>= lx 0) (>= ux 0) (>= ly 0) (>= uy 0)) (make-interval (* lx ly) (* ux uy)))
     ((and (>= lx 0) (>= ux 0) (<  ly 0) (>= uy 0)) (make-interval (* ux ly) (* lx uy)))
     ((and (>= lx 0) (>= ux 0) (<  ly 0) (<  uy 0)) (make-interval (* ux uy) (* lx ly)))
     ((and (<  lx 0) (>= ux 0) (>= ly 0) (>= uy 0)) (make-interval (* lx uy) (* ux ly)))
     ((and (<  lx 0) (>= ux 0) (<  ly 0) (>= uy 0)) (make-interval (max (* lx uy) (* ux ly)) (max (* lx ly) (* ux uy))))
     ((and (<  lx 0) (>= ux 0) (<  ly 0) (<  uy 0)) (make-interval (* ux uy) (* lx ly)))
     ((and (<  lx 0) (<  ux 0) (>= ly 0) (>= uy 0)) (make-interval (* ux ly) (* lx uy)))
     ((and (<  lx 0) (<  ux 0) (<  ly 0) (>= uy 0)) (make-interval (* lx uy) (* ux ly)))
     ((and (<  lx 0) (<  ux 0) (<  ly 0) (<  uy 0)) (make-interval (* ux uy) (* lx ly))))))
