; fib(0) = 0
; fib(1) = 1
; fib(n) = fib(n - 1) + fib(n - 2)
;
; Prove:
;   fib(n) = closest integer to phi^n / sqrt(5),
;   where phi = (1 + sqrt(5)) / 2
;
; Let:
;   psi = (1 - sqrt(5)) / 2
;
; Prove:
;   fib(n) = (phi^n - psi^n) / sqrt(5).
;
; Case n = 0:
;   (phi^0 - psi^0) / sqrt(5)
;   => {arithmetic}
;   (1 - 1) / sqrt(5)
;   => {arithmetic}
;   0 / sqrt(5)
;   => {arithmetic}
;   0
;   => {definition}
;   fib(0)
;
; Case n = 1:
;  (phi^1 - psi^1) / sqrt(5)
;  => {arithmetic}
;  (phi - psi) / sqrt(5)
;  => {definition}
;  ((1 + sqrt(5)) / 2) - ((1 - sqrt(5)) / 2)) / sqrt(5)
;  => {arithmetic}
;  (1/2 + sqrt(5)/2 - 1/2 + sqrt(5)/2) / sqrt(5)
;  => {arithmetic}
;  (sqrt(5)/2 + sqrt(5)/2) / sqrt(5)
;  => {arithmetic}
;  sqrt(5) / sqrt(5)
;  => {arithmetic}
;  1
;  => {definition}
;  fib(1)
;
; Case n > 1:
;  fib(n)
;  => {definition}
;  fib(n - 1) + fib(n - 2)
;  => {induction}
;  (phi^(n-1) - psi^(n-1)) / sqrt(5) + (phi^(n-2) - psi^(n-2)) / sqrt(5)
;  => {arithmetic}
;  (phi^(n-1) + phi^(n-2) - psi^(n-1) - psi^(n-2)) / sqrt(5)
;  => {arithmetic}
;  (phi^(n-1) + phi^(n-2) - (psi^(n-1) + psi^(n-2))) / sqrt(5)
;  => {arithmetic}
;  (phi^n * (phi^-1 + phi^-2) - psi^n * (psi^-1 + psi^-2)) / sqrt(5)
;  => {arithmetic}
;  (phi^n * 1 - psi^n * 1) / sqrt(5)
;  => {arithmetic}
;  (phi^n - psi^n) / sqrt(5)
;
; QED.