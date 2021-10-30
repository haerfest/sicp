(load "ex-2.12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define A (make-center-percent 10 1))
(define B (make-center-percent 20 1))

;; (par1 A B)
;; => (6.469 . 6.869)
;; (center (par1 A B)
;; => 6.669
;; (percent (par1 A B))
;; => 2.999 =~ 3

;; (par2 A B)
;; => (6.6 . 6.733)
;; (center (par2 A B)
;; => 6.667
;; (percent (par2 A B))
;; => 0.999 =~ 1

;; The problem is that the small tolerances behave differently, dependent on the
;; operation. Approximated for small percentages:
;;
;; (percent (div-interval A B)) = (+ (percent A) (percent B))
;; (percent (mul-interval A B)) = (+ (percent A) (percent B))
;; (percent (add-interval A B)) = (/ (+ (percent A) (percent B))
;;                                   2)
;;
;; So given (and (= 1 (percent A))
;;               (= 1 (percent B))), then (par1 A B) approximately
;; has this effect on the resulting tolerance:
;;
;; (percent (div (mul A B) (add A B)))
;; =~
;; (+ (+ 1 1) (/ (+ 1 1) 2))
;; =~
;; 3
;;
;; And (par2 A B) approximately has this effect, where (= 0 (percent ONE)):
;;
;; (percent (div ONE (add (div ONE A) (div ONE B))))
;; =~
;; (+ 0 (/ (+ (+ 0 1) (+ 0 1)) 2))
;; =~
;; 1
