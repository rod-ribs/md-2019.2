#|
Três irmãs - Ana, Maria e Cláudia - foram a uma festa com vestidos de
cores diferentes. Uma vestia azul, a outra branco e a Terceira
preto. Chegando à festa, o anfitrião perguntou quem era cada uma
delas. As respostas foram:

- A de azul respondeu: “Ana é a que está de branco”
- A de branco falou: “Eu sou Maria”
- A de preto disse:  “Cláudia é quem está de branco”

O anfitrião foi capaz de identificar corretamente quem era cada pessoa
considerando que:

- Ana sempre diz a verdade
- Maria às vezes diz a verdade
- Cláudia nunca diz a verdade

Pensando um pouco sobre o problema, pode-se concluir que a Ana estava
com o vestido preto, a Cláudia com o branco e a Maria com o
azul.
|#


(in-package :snark-user)

(initialize)
(use-resolution t)

(assert '(and
	  (or AA AB AP)
	  (or CA CB CP)
	  (or MA MB MP)))

(assert '(and
	  (or AA CA MA)
	  (or AB CB MB)
	  (or AP CP MP)))

(assert '(and
	  (not (and AA AB)) (not (and AB AP)) (not (and AA AP))
	  (not (and CA CB)) (not (and CB CP)) (not (and CA CP))
	  (not (and MA MB)) (not (and MB MP)) (not (and MA MP))))

(assert '(and
	  (not (and AA CA)) (not (and AA MA)) (not (and CA MA))
	  (not (and AB CB)) (not (and AB MB)) (not (and CB MB))
	  (not (and AP CP)) (not (and AP MP)) (not (and CP MP))))


(assert '(implies AA AB))

(assert '(implies CA (not AB)))

(assert '(not AB))

(assert '(implies AP CB))

(assert '(implies CP (not CB)))

(prove '(and AP CB MA))
