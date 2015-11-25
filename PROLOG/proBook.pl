/* Aprendendo Prolog com o Livro online 'learn prolog now' */
% KB1
mulher(mia).
mulher(jody).
mulher(yolanda).

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

