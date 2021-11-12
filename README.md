# [SICP](https://mitpress.mit.edu/sicp/)
Structure and Interpretation of Computer Programs (Second Edition).

## Racket

To prepare the command-line `racket`:

```
> (require sicp)            ; SICP compatibility
> (print-as-expression #f)  ; print mutable cons cells as lists
> (#%require r5rs/init)     ; round braces around mutable cons cells
```
