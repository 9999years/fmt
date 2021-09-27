#lang racket

;; low :: number? -> listof number?
(define low
(λ (argument)
   (cond
       (; this is the base case
        (zero? argument)
            '())
       (else
          (define content (* argument (+ argument 1) (+ argument 2)
          (+ argument 3) (+ argument 4))
            )
    (define next (low (sub1 argument))) ; this is the recursive call

(cons  content    next)))))


     ;; high :: number? -> listof number?
(define high ...)


    (append
(low

0)
                      (high 42))
