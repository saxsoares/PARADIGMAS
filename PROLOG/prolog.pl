fruta(abacaxi).
fruta(banana).
gosta(joao, peixe).
gosta(maria, peixe).
gosta(joao,maria).
gosta(maria,livro).
gosta(pedro,livro).
gosta(maria,flor).
gosta(maria,vinho).
gosta(maria,comida).
gosta(joao,rubi).
gosta(joao,X):-
	gosta(X,vinho). 
ladrao(joao).
ladrao(pedro).
rouba(X,Y):-
	ladrao(X),gosta(X,Y).
/* progenitor(X,Y) significa que X é progenitor de Y */
progenitor(pedro, carlos).
progenitor(pedro, ana).
progenitor(carlos,antonio).
progenitor(carlos,maria).
progenitor(joana,antonio).
progenitor(joana,maria).
progenitor(joana,ana).
/* definindo alguns fatos sobre o sexo */
homem(pedro).
homem(carlos).
homem(antonio).
mulher(ana).
mulher(maria).
/* pai(X,Y) significa que X é pai de Y */
pai(X,Y):-progenitor(X,Y) , homem(X).
/* mae(X,Y) significa que X é mãe de Y */
mae(X,Y):-progenitor(X,Y), mulher(X).  
irma(X,Y):-mulher(X),progenitor(Z,X),progenitor(Z,Y),X\=Y.

passaro(tweety).
peixe(goldie).
minhoca(squiggly).
gato(miau).
gostam(X,Y):-(passaro(X),minhoca(Y));(gato(X),peixe(Y));(gato(X),passaro(Y));(amigo(X,Y)).
