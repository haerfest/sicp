; Transformation Tpq(a,b):
;   a <- bq + aq + ap
;   b <- bp + aq
;
; Show Tpq(Tpq(a,b)) = Tp'q'(a,b) where p' = f(p,q) and q' = g(p,q).
;
; Tpq(Tpq(a,b))
; => {definition}
; Tpq(bq + aq + ap, bp + aq)
; => {definition}
; ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q)
; => {arithmetic}
; (bpq + aqq + bqq + aqq + apq + bqp + aqp + app, bpp + aqp + bqq + aqq + apq)
; => {arithmetic}
; (bpq + bqq + bqp + aqq + aqq + apq + aqp + app, bpp + bqq + aqp + aqq + apq)
; => {arithmetic}
; (b(pq + qq + qp) + a(pq + qq + qp) + a(pp + qq), b(pp + qq) + a(pq + qq + qp))
; => {arithmetic}
; (b(pq + pq + qq) + a(pq + pq + qq) + a(pp + qq), b(pp + qq) + a(pq + pq + qq))
; => {define q'=pq + pq + qq ^ p'=pp + qq}
; (bq' + aq' + ap', bp' + aq')
; => {definition}
; Tp'q'(a,b)

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (even? x)
  (= (remainder x 2) 0))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* p q) (* p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))