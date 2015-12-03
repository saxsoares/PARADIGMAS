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
irma(X,Y):-
	mulher(X),
	progenitor(Z,X),
	progenitor(Z,Y),X\=Y.

passaro(tweety).
peixe(goldie).
minhoca(squiggly).
gato(miau).
gostam(X,Y):-
	(passaro(X),minhoca(Y));
	(gato(X),peixe(Y));
	(gato(X),passaro(Y));
	(amigo(X,Y)).

casou(joao, maria, dia(5, maio, 2000)).
casou(jose, claudia, dia(11, novembro, 1950)).
casou(andre, fernanda, dia(11, agosto, 1960)).
casou(adriano, claudia, dia(15, outrubro, 1973)).

descendente(X,Y):-
	progenitor(Y,X).
descendente(X,Y):-
	progenitor(Y,Z),
	descendente(X,Z).

fatorial(0,1).
fatorial(N,F):-
	N>0,
	N1 is N - 1,
	fatorial(N1,F1),
	F is N * F1.

insereInicio(H, L, [H|L]):-
	!.

reg-->("a";"b";"c";"d"), "x".
bin-->("0","1");("0";"1"),bin.

%ex01
s--> "a",s,"b";"a","b".

%ex02
b-->("b",b;"b").
a-->("a",a;"a").
ss-->b,"a",a,"b".

%ex03
dig-->"0";"1";"2";"3";"4";"5";"6";"7";"8";"9".
num-->dig,num;dig.
expr-->(num,"+",expr);(num,"-",expr);num.

%ex05
id-->"a";"b";"c";"d".
exp-->("(",exprr,")");id.

fator-->exp,fatorrep.
fatorrep-->"";("**",exp,fatorrep).

termo-->fator,termorep.
termorep-->"";(("*";"/"),fator,termorep).

exprr-->termo,exprep.
exprep-->"";(("+";"-"),termo,exprep).

%ex06
aux1-->"";",",nomevar,aux1.
defvar-->tipo,nomevar,aux1,";";tipo,nomevar,aux1,";",defvar.

tipo-->"void ";"float ";"double ";"int ";"char ".
letras-->"a";"b";"c";"A";"B";"C".
inteiro-->dig;dig,inteiro.

nomevar-->star,letras,letedig,intaux.
star-->"";"*",star.
letedig-->"";(letras;dig;"_"),letedig.
intaux-->"";("[",inteiro,"]"),intaux.











