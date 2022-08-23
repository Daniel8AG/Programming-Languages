#lang racket


(define (countdown n)
  (if (equal? n 0)
       (list 0)
       (cons n (countdown (- n 1)))))


(define (insertL a b ls)
  (if (empty? ls)
      '()
      (if (eqv? a (car ls))
          (cons b (cons a (insertL a b (rest ls))))
          (cons (car ls)(insertL a b (rest ls))))))


(define (remv-1st symbol ls)
  (if (empty? ls)
      '()
      (if (eqv? symbol (car ls))
          (cons (car (rest ls))(rest (rest ls)))
          (cons (car ls)(remv-1st symbol (rest ls))))))


(define (map p ls)
  (if (empty? ls)
      '()
      (cons (p (car ls)) (map p (rest ls)))))


(define (filter pred ls)
  (if (empty? ls)
      '()
      (if (pred (car ls))
          (cons (car ls) (filter pred (rest ls)))
          (filter pred (rest ls)))))


(define (zip ls1 ls2)
  (if (or (empty? ls1) (empty? ls2))
      '()
      (cons (cons (car ls1) (car ls2)) (zip (rest ls1) (rest ls2)))))

  
(define (list-index-ofv elmnt ls)
  (if (equal? elmnt (car ls))
      '0
      (+ 1 (list-index-ofv elmnt (rest ls)))))


(define (append ls1 ls2)
  (if (empty? ls1)
      ls2
      (cons (first ls1) (append (rest ls1) ls2))))


;(define (reverse ls)      // Invierte el orden, pero regresa pares y no una lista...
;  (if (empty? ls)
;      ls
;      (cons (reverse (rest ls))(first ls))))    

(provide (all-defined-out))
