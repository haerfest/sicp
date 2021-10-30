;; I have the idea that under multiplication of two intervals with relatively
;; small percentual tolerances, the product's final tolerance can be
;; approximated by adding up the individual tolerancs.
;;
;; (percent (mul-interval (make-center-percent x xp)
;;                        (make-center-percent y yp)))
;; =~
;; (+ xp yp)
;;
;; No demonstration yet.
