#lang scheme

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x)
  (* x x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (simpson f a b n)
  (if (even? n)
      (simpson-even f a b n)
      (simpson-even f a b (+ 1 n))))

(define (simpson-even f a b n)
  (let ((h (/ (- b a) n)))
    (define (y k)
      (f (+ a (* k h))))
    (define (iter i m sum)
      (if (= i n)
          (+ sum (y n))
          (iter (+ i 1)
                (- 6 m)
                (+ sum (* m (y i))))))
    (/ (* h (iter 1 4 (y 0))) 3.0) ))


(integral cube 0 1 0.001) ;; 0.249999875000001

(simpson cube 0 1 100) ;; 0.25 
(simpson cube 0 1 50) ;; 0.25 
(simpson cube 0 1 25) ;; 0.25 
(simpson cube 0 1 13) ;; 0.25 
(simpson cube 0 1 6) ;; 0.25 
(simpson cube 0 1 3) ;; 0.25 
(simpson cube 0 1 2) ;; 0.25 

;; simpson algorithm find the answser with n=2!
;; the simple algo doesn't find the right answer in 1000 steps (looser^^)


