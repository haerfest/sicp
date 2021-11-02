;; The answer is reversed because it traverses the items front to back, and
;; conses each subsequent squared number to the front of the answer list.

;; The new implementation below places the squared values in the right order,
;; but it does not build a proper list:
;;
;; (square-list (list 1 2 3))
;; => (((() . 1) . 4) . 9)
;;
;; When it conses, it takes the answer up until that point, and sticks it in
;; the car of the pair. It then adds the current squared value as the cdr.
;; It essentially builds a 'list' where each cons cell has its car and cdr
;; swapped or reversed -- it's a list that grows vertically via the cars, not
;; horizontally via the cdrs.

(define nil '())

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items nil))
