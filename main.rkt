#lang racket

(provide permutation)

; listof(any) -> listof(listof(any)
(define (permutation l)
  (cond [(empty? l) '(())]
	[else
	  (foldr (lambda (elem acc)
		   (append
		     (map (lambda (lst) (cons elem lst))
			  (permutation (set->list (set-remove (list->set l) elem))))
		     acc))
		 '()
		 l)]))

