(in-package :snark-user)

(initialize)
(use-resolution t)

(prove '(implies
	 (and
	  (or P11 P12)
	  (or P21 P22)
	  (or P31 P32))
	 (or
	  (or
	   (and P11 P21)
	   (and P11 P31)
	   (and P21 P31))
	  (or
	   (and P12 P22)
	   (and P22 P32)
	   (and P12 P32)))))


(prove '(implies (and C (or A B)) (or (and C A) (and C B))))
