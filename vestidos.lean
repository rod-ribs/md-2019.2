/- 
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
-/

section 
 parameters ( AA AB AP MA MB MP CA CB CP : Prop )

-- cada uma veste algum vestido
variable h1 : AA ∨ AB ∨ AP 
variable h2 : MA ∨ MB ∨ MP 
variable h3 : CA ∨ CB ∨ CP 

-- X veste apenas um vestido
variable h4 : (AA → (¬ AB ∧ ¬ AP)) ∧ (AB → (¬ AA ∧ ¬ AP)) ∧ (AP → (¬ AA ∧ ¬ AB))
variable h5 : (CA → (¬ CB ∧ ¬ CP)) ∧ (CB → (¬ CA ∧ ¬ CP)) ∧ (CP → (¬ CA ∧ ¬ CB))
variable h6 : (MA → (¬ MB ∧ ¬ MP)) ∧ (MB → (¬ MA ∧ ¬ MP)) ∧ (MP → (¬ MA ∧ ¬ MB))

-- cada vestido é usado por alguma irmã
variable h7 : AA ∨ MA ∨ CA 
variable h8 : AB ∨ MB ∨ CB 
variable h9 : AP ∨ MP ∨ CP 

-- X é usado por apenas uma irmã
variable h10 : (AA → (¬ CA ∧ ¬ MA)) ∧ (CA → (¬ AA ∧ ¬ MA)) ∧ (MA → (¬ AA ∧ ¬ CA)) 
variable h11 : (AB → (¬ CB ∧ ¬ MB)) ∧ (CB → (¬ AB ∧ ¬ MB)) ∧ (MB → (¬ AB ∧ ¬ CB)) 
variable h12 : (AP → (¬ CP ∧ ¬ MP)) ∧ (CP → (¬ AP ∧ ¬ MP)) ∧ (MP → (¬ AP ∧ ¬ CP)) 

-- se ana de azul 
variable h13 : AA → AB

-- se claudia de azul
variable h14 : CA → ¬ AB

-- se ana de branco
variable h15 : ¬ AB

-- se ana de preto
variable h18 : AP → CB

-- se claudia de preto (redundante)
variable h19 : CP → ¬ CB

lemma ana : AP :=
or.elim h1 
 (λ h₂ : AA, show AP, from false.elim (absurd h₂ (λ h₁ : AA, show false, 
  from (absurd (h13 h₁) h15))))
 (λ h₂ : AB ∨ AP, show AP, 
  from or.elim h₂ 
   (λ h₃ : AB, show AP, from false.elim (absurd h₃ h15))
   (λ h₃ : AP, h₃))

#check @ana

lemma claudia : CB :=  (h18 (ana h1 h13 h15))

lemma maria : MA := 
or.elim h2
  (λ h₁ : MA, h₁)
  (λ h₁ : (MB ∨ MP), 
    or.elim h₁ 
      (λ h₂ : MB, show MA, 
        from absurd 
           (claudia h1 h13 h15 h18)
           (h11.right.right h₂).right)
      (λ h₂ : MP, show MA, 
        from absurd  
          (ana h1 h13 h15) 
          (and.left ((and.right (and.right h12)) h₂))))


theorem solution1 : AP ∧ CB ∧ MA := 
  ⟨(ana h1 h13 h15), 
   ⟨ (claudia h1 h13 h15 h18), (maria h1 h2 h11 h12 h13 h15 h18) ⟩⟩

theorem solution2 : AP ∧ CB ∧ MA := 
  and.intro (ana h1 h13 h15) 
    (and.intro (claudia h1 h13 h15 h18) (maria h1 h2 h11 h12 h13 h15 h18))

#check @solution1

end 

