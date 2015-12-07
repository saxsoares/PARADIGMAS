/* Aprendendo Prolog com o Livro online 'learn prolog now' */
% KB1
woman(mia).
woman(jody).
woman(yolanda).

party.

happy(yolanda). 
happy(vicent).

%KB2
listens2Music(mia). 
listens2Music(yolanda):-
	happy(yolanda).
lsitens2Music(bucth).

playsAirGuitar(vicent):-
	listens2Music(vicent),
	happy(vicent). 
playsAirGuitar(butch):-
	happy(butch);
	listens2Music(butch).
playsAirGuitar(mia):-
	listens2Music(mia). 
playsAirGuitar(yolanda):-
	listens2Music(yolanda).

loves(vincent,mia). 
loves(marsellus,mia). 
loves(pumpkin,honey_bunny). 
loves(honey_bunny,pumpkin).

jealous(X,Y):-
	loves(X,Z),
	loves(Y,Z).

%Ex 1.5
wizard(ron). 
wizard(X):-
	hasWand(X), 
	hasBroom(X). 
hasWand(harry). 
quidditchPlayer(harry). 
hasBroom(X):-
	quidditchPlayer(X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ladrao(joao).
ladrao(pedro).
gosta(maria,comida).
gosta(maria,vinho).
gosta(joao,rubi).
gosta(joao,X):-
    gosta(X,vinho).
    

rouba(X,Y):-
    ladrao(X),
    gosta(X,Y).

/* progenitor(X,Y) significa que X é progenitor de Y */
progenitor(pedro, carlos).
progenitor(pedro, ana).
progenitor(carlos,antonio).
progenitor(carlos,maria).

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

irmaao(X,Y):-
    progenitor(W,Y),
    progenitor(W,X),
    \=(X,Y).

filho(X,Y):-
    progenitor(Y,X).

avo(X,Y):-
    progenitor(X,W),
    progenitor(W,Y).

tio(X,Y):-
    irmaao(X,W),
    progenitor(W,Y).

progenit2(X,Y):-
    pai(X,Y);
    mae(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
passaro(tweety).
peixe(goldie).
minhoca(squiggly).
gato(meu).
eu.

gostam(X,Y):-(
    passaro(X),
    minhoca(Y));
    (gato(X),peixe(Y));
    (gato(X),passaro(Y)).
    

amigos(X,Y):-
    gostam(X,Y),
    gostam(Y,X).

come(X,Y):-
    gostam(X,Y),
    gato(X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maior(X,Y,X):-X>=Y.
maior(X,Y,Y):-X<Y.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
casou(joao, maria, dia(5, maio, 2000)).
casou(jose,claudia, dia(11,novembro,1950)).
casou(andre, fernanda, dia(11, agosto, 1960)).
casou(adriano, claudia, dia(15, outubro, 1973)).

antepassado(X,Y):-
    progenitor(X,Y).
antepassado(X,Y):-
    progenitor(X,W),
    antepassado(W,Y).
