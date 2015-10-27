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

fibonacci::Integer->Integer
fibonacci x
	|x==1 = 1
	|x==2 = 1
	|otherwise=(fibonacci (x-1))+(fibonacci (x-2))

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

