; n = amount to be changed.
;
; Order of growth in space:
;   The recursive definition of cc uses space that depends linearly on n,
;   so O(n).
;
; Order of growth in steps:
;   Worst case at each invodation of cc both branches are taken, so O(2^n).
;
; The ugly code below prints a Graphviz file to standard output.

(define *node-id* 0)

(define (node-id)
  (set! *node-id* (inc *node-id*))
  *node-id*)

(define (plot-from-node id amount kinds-of-coins)
  (display "  { ")
  (display id)
  (display "[label=\"(cc ")
  (display amount)
  (display " ")
  (display kinds-of-coins)
  (display ")\"] } -- "))
  
(define (plot-to-node id amount kinds-of-coins)
  (display "{ ")
  (display id)
  (display "[label=\"(cc ")
  (display amount)
  (display " ")
  (display kinds-of-coins)
  (display ")\"] }\n"))

(define (plot-color-node id)
  (display "  ")
  (display id)
  (display "[style=filled,color=\".7 .3 1.0\"]\n"))
  
(define (count-change amount)
  (display "graph {\n")
  (let ((ans (cc amount 5 *node-id* nil)))
    (display "}\n")
    ans))

(define (cc amount kinds-of-coins id plot-from-node-fn)
  (if (not (null? plot-from-node-fn))
      (begin
        (plot-from-node-fn)
        (plot-to-node id amount kinds-of-coins))
      'ignore)
  (cond ((= amount 0) (plot-color-node id) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else
         (+ (cc amount
                (- kinds-of-coins 1)
                (node-id)
                (lambda () (plot-from-node id amount kinds-of-coins)))
            (cc (- amount
                   (first-denomination kinds-of-coins))
                kinds-of-coins
                (node-id)
                (lambda () (plot-from-node id amount kinds-of-coins)))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))