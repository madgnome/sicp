#lang scheme

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (r a b)
  (remainder (a b)))

(gcd 206 40)
(if (= 206 0) 40 (gcd 40 (r 206 40)))
(gcd 40 (r 206 40))
(if (= (r 206 40) 0) 40 (gcd (r 206 40) (r 40 (r 206 40))))
(if (= 6 0) 40 (gcd (r 206 40) (r 40 (r 206 40)))) ;; 1
(gcd (r 206 40) (r 40 (r 206 40))) ;; 1
(if (= (r 40 (r 206 40)) 0) (r 206 40) (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))) ;; 1
(if (= 4 0) (r 206 40) (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))) ;; 3
(gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) ;; 3
(if (= (r (r 206 40) (r 40 (r 206 40))) 0) (r 40 (r 206 40)) (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40)))))) ;; 3
(if (= 2 0) (r 40 (r 206 40)) (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40)))))) ;; 3
(gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40))))) ;; 7
(if (= (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40)))) 0) (r (r 206 40) (r 40 (r 206 40))) (gcd (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40)))) (r (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40))))))) ;; 7
(if (= 0 0) (r (r 206 40) (r 40 (r 206 40))) (gcd (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40)))) (r (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40))  (r (r 206 40) (r 40 (r 206 40))))))) ;; 14
(r (r 206 40) (r 40 (r 206 40))) ;; 14
(r (r 206 40) (r 40 6)) ;; 15
(r (r 206 40) 4) ; 16
2 ;; 18

;; Remainder is called 18 times using normal order evaluation

(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (r 206 40)))
(gcd 40 (r 206 40)) ;; 1
(gcd 40 6) ;; 1
(if (= 6 0) 40 (gcd 6 (r 40 6))) ;; 1
(gcd 6 (r 40 6)) ;; 1
(gcd 6 4) ;; 2
(if (= 4 0) 6 (gcd 4 (r 6 4))) ;; 2
(gcd 4 (r 6 4)) ;; 2
(gcd 4 2) ;; 3
(if (= 2 0) 4 (gcd 2 (r 4 2))) ;; 3
(gcd 2 (r 4 2)) ;; 3
(gcd 2 0) ;; 4
(if (= 0 0) 2 (gcd 0 (r 2 0)))  ;; 4
2 ;; 4

;; Remainder is called only 4 times using application order evaluation