(define (fold-right op initial sequence)
  (define (iter rest)
    (if (null? rest)
        initial
        (op (car rest)
            (iter (cdr rest)))))
  (iter sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;; Answer: op must be commutative to ensure that fold-{left,right}
;; produce the same values for any sequence.
;;
;; Commutative => (= (op a b) (op b a))

;; > (fold-right / 1 (list 1 2 3))
;; 3/2
;; > (fold-left  / 1 (list 1 2 3))
;; 1/6

;; > (fold-right list nil (list 1 2 3))
;; (1 (2 (3 ())))
;; > (fold-left  list nil (list 1 2 3))
;; (((() 1) 2) 3)
