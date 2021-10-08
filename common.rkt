#lang racket/base

(provide (struct-out thing)
         (struct-out commentable)
         (struct-out visible)
         (struct-out node)
         (struct-out atom)
         (struct-out nl)
         (struct-out line-comment)
         (struct-out sexp-comment)
         (struct-out wrapper)

         strip-comment)

(struct thing () #:transparent)
(struct commentable thing (inline-comment) #:transparent)
(struct visible commentable () #:transparent)
(struct node visible (opener closer prefix breakable-prefix content) #:transparent)
(struct atom visible (content type) #:transparent)
;; invariant: n >= 1
(struct nl thing (n) #:transparent)
(struct line-comment thing (content) #:transparent)
;; when style is 'disappeared or 'any, content must have length exactly one
(struct sexp-comment commentable (style tok content) #:transparent)
(struct wrapper visible (tk content) #:transparent)

;; strip-comment :: commentable? -> commentable?
(define (strip-comment obj)
  (if (commentable-inline-comment obj)
      (cond
        [(node? obj) (struct-copy node obj [inline-comment #:parent commentable #f])]
        [(atom? obj) (struct-copy atom obj [inline-comment #:parent commentable #f])]
        [(wrapper? obj) (struct-copy wrapper obj [inline-comment #:parent commentable #f])]
        [(sexp-comment? obj) (struct-copy sexp-comment obj [inline-comment #:parent commentable #f])])
      obj))