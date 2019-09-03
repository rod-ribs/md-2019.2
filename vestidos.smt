
; z3 vestidos.smt

(set-option :dump_models true)

(declare-const AA Bool)
(declare-const AB Bool)
(declare-const AP Bool)

(declare-const CA Bool)
(declare-const CB Bool)
(declare-const CP Bool)

(declare-const MA Bool)
(declare-const MB Bool)
(declare-const MP Bool)

(assert (and (or AA AB AP) (or CA CB CP) (or MA MB MP)))

(assert (and (or AA CA MA) (or AB CB MB) (or AP CP MP)))

(assert (and (not (and AA AB)) (not (and AB AP)) (not (and AA AP))
	  (not (and CA CB)) (not (and CB CP)) (not (and CA CP)) (not
	  (and MA MB)) (not (and MB MP)) (not (and MA MP))))

(assert (and (not (and AA CA)) (not (and AA MA)) (not (and CA MA))
	  (not (and AB CB)) (not (and AB MB)) (not (and CB MB)) (not
	  (and AP CP)) (not (and AP MP)) (not (and CP MP))))


(assert (=> AA AB))

(assert (=> CA (not AB)))

(assert (not AB))

(assert (=> AP CB))

(assert (=> CP (not CB)))

(check-sat)

