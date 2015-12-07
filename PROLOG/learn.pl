/* definindo alguns fatos: progenitor(X,Y) significa que X é progenitor
de Y */
progenitor(pedro, carlos).
progenitor(pedro, ana).
progenitor(carlos,antonio).
progenitor(carlos,maria).
progenitor(maria,fmaria).
progenitor(fmaria,ffmaria).

/* definindo alguns fatos sobre o sexo */
homem(pedro).
homem(carlos).
homem(antonio).

mulher(ana).
mulher(maria).

descendente(X,Y):-
    progenitor(Y,X).
descendente(X,Y):-
    progenitor(Y,Z),
    descendente(X,Z).

fatorial(0,1).
fatorial(N,F):-
    N>0,
    N2 is N - 1,
    fatorial(N2,F2),
    F is N * F2.

pai(adao,cain).
pai(adao,abel).
pai(adao,seth).
pai(seth,enos).

avo(X,Y):-
    pai(X,Z),
    pai(Z,Y).

irmao(X,Y):-
    pai(Z,X),
    pai(Z,Y),
    X \= X.

%% Maior divisor comum  %%%%%%%%%%%%%%%%%%%
mdc(X,X,X).
mdc(X,Y,D):-
    X<Y,
    Dif is Y - X,
    mdc(X,Dif,D).
mdc(X,Y,D):-
    Y>X,
    mdc(Y,X,D).

% país(Nome, Área, População)
pais(brasil, 9, 130).
pais(china, 12, 1800).
pais(eua, 9, 230).
pais(india, 3, 450).

animal(peixe).
animal(passaro).
animal(mamifero).

peixe(tubarao).
peixe(salmao).

passaro(avetruz).
passaro(canario).

cor(X):-
    passaro(X).

nadam(X):-
	animal(X),
	X == peixe.

voam(X):-
	animal(X),
	X == passaro,
	X \= avestruz.

andam(X):-
    animal(X),
    X == mamifero,
    X \= morcego.

botam(X):-
	animal(X),
	X \= mamifero,
	(peixe(X);passaro(X)),
    X \= tubarao.


%%%%%%%%%%%%%%%%%

dig(0).
dig(1).
bin([A,B,C]) :- dig(A),dig(B),dig(C), write([A,B,C]), nl, fail.

lista([1,a,dia(seg)]).

conc([],L,L).
%conc(L,[],L).
conc([X|L1],L2,[X,L3]):-
    conc(L1,L2,L3).

membro(X,[X|_]).
membro(X,[_|L]):-
    membro(X,L).

insere(X,[],[X]).
insere(X,L,[X|L]).

ninsere(X,0,L,[X|L]).
    

ninsere(X,N,L,Lr):-
    N > 0,
    N1 is N - 1,
    ninsere(X,N1,[_,L],Lr).









