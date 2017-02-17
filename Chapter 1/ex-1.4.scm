; The name suggests it wants to return a + |b|.
; If b > 0:
;   It evaluates to (+ a b) or a + b.
;   And a + b = a + |b| when b > 0.
; If b = 0:
;   It evaluates to (- a b) or a - b.
;   And a - b = a + |b| when b = 0.
; If b < 0:
;   It evaluates to (- a b) or a - b.
;   And a - b = a + |b| when b < 0.
; Conclusion: it returns a + |b| in all cases.