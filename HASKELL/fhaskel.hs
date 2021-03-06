cubo::Float->Float
cubo lado=lado**3

potencia_2::Float->Float
potencia_2 x=x*x

potencia_4::Float->Float
potencia_4 x=potencia_2 x*potencia_2 x

inversa::Float->Float
inversa x
	|x==0=0.0
	|otherwise = 1/x

menor::Int->Int->Int
menor x y
	|x>y=y
	|x<y=x
	|otherwise=x

isdifferent::Int->Int->Int->String
isdifferent x y z
	|x==y = "x = y"
	|x==z = "x = z"
	|y==z = "y = z"

fibonacci::Int->Int
fibonacci  x
	|x==1 = 1
	|x==2 = 1
	|otherwise=(fibonacci ( x-1)) + (fibonacci  ( x-2))

fatorial::Integer->Integer
fatorial x
	|x==0 = 1
	|otherwise=x*fatorial(x-1)

combinacao::Integer->Integer->Integer
combinacao m n=(fatorial (m))`div`( (fatorial (n))*(fatorial(m-n)) )

toString::Float->String
toString x = show x

toFloat::String->Float
toFloat x = read x
	
--  Listas --

lista1::[(Int,Int)]
lista1 = [(1,5),(5,25)]

minmax::[Int]->(Int,Int)
minmax lista
	|lista == [] = (0,0)
	|otherwise = (head(lista),last(lista))

miololista::String->String
miololista lista 
	|length lista < 2 = ""
	|otherwise=init(tail(lista))

k_elemento::[gen]->Int->gen
k_elemento lista k
	|k > length lista = last lista
	|otherwise = lista!!k

insere y [] = [y] 
insere y (x:xs)
	|y == x = (x:xs)
	|otherwise = x:insere y xs

elimina_rep [a] = [a]
elimina_rep (x:xs)
	|x == head(xs) = elimina_rep xs
	|otherwise = x:elimina_rep xs	

dobro::Int->Int
dobro x = 2 * x

triplo::Int->Int
triplo x = 3 * x

dist::(Int->Int)->(Int, Int)->(Int, Int)
dist f (x, y) = (f x, f y)

funcao::(Int->Int)->Int->Int
funcao func x = func x

fresulta::Int->(Int->Int)
fresulta x 
	|x == 1 = dobro 
	|x == 2 = triplo

sextuplo::Int->Int
sextuplo = dobro.triplo

removeA::String->String
removeA xs = [x | x<-xs, x /='a']

casamento::(Int,Int, [Int], [Int])->String
casamento (0,x,(c:cs),[_,_])="Casou"
casamento _ = "nao casou"

listapq::Int->Int->[Int]
listapq a b = lista 
	where
		quad x = x^2
		lista = [quad x|x<-[a..b], mod x 2 == 0]

listapqlet::Int->Int->[Int]
listapqlet a b = let quad x = x^2 in [quad x|x<-[a..b], mod x 2 == 0]

baskara::Double->Double->Double->(Double, Double)
baskara a b c = (x1, x2)
	where
		delta = (b^2 - 4*a*c)
		x1 = (-(b) + sqrt(delta)) / 2*a
		x2 = (-(b) - sqrt(delta)) / 2*a

rotacaoesq::[a]->[a]
rotacaoesq (x:xs) = xs++[x]

nrotacaoesq::[a]->Int->[a]
nrotacaoesq lista n = fim ++ ini
	where
		ini = take n lista
		fim = drop n lista
	 
