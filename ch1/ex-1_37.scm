#lang scheme

(define (cont-frac n d k)
  (define (rec i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (rec (+ i 1))))))
  (rec 1))

(define (unit i) 1.0)

;; 1 / phi => 0.6180...
(cont-frac unit unit 10) ;; 0.6179775280898876
(cont-frac unit unit 11) ;; 0.6180555555555556

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac-iter unit unit 10)
(cont-frac-iter  unit unit 11)
