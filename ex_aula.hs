{- Exercicios de Aula - Haskell -}

cubo::(Num a)=>a->a
cubo l = l ^ 3          -- potencia inteiro -> ^, potencia float -> **


potencia2::(Num a)=> a -> a
potencia2 n = n ^ 2

potencia4 = potencia2.potencia2

potencia4':: (Num a)=>a->a
potencia4' n = potencia2 (potencia2 n)

min'::(Ord a)=>a->a->a
min' x y
    | x > y = y
    |otherwise = x

compare3::(Show a, Eq a)=>a->a->a->String
compare3 a b c
    | a == b && a == c = show a ++ " = " ++ show b ++ " = " ++ show c
    | a == b =  show a ++ " = " ++ show b
    | a == c = show a ++ " = " ++ show c
    | b == c = show b ++ " = " ++ show c
    | otherwise = " Diferentes "

fibonacci::Int->Int
fibonacci n
    | n <= 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n-1) + fibonacci (n-2)

raiz6::Int->Float
raiz6 0 = 0
raiz6 n = sqrt (9 + raiz6 (n-1))

somatupla::Int->Int->Int->(Int,Int)
somatupla x a b = (a+x, b+x)

pessoa::Float->(String, Float, Char)
pessoa rg
    |rg == 1 = ("Joao Silva", 12, 'm')
    |rg == 2 = ("Maria Santos", 30, 'f')
    |rg == 3 = ("Jonas Souza", 51, 'm')
    |rg == 4 = ("Silvia Cardoso", 15, 'f')
    |rg == 5 = ("Jose Coelho", 64, 'm')
    |rg == 6 = ("Manoel Pontes", 19, 'm')
    |rg == 7 = ("Joao Carvalho", 13, 'm')
    |rg == 8 = ("Marcia Santana", 37, 'f')
    |rg == 9 = ("Cassia Martinez", 21, 'f')
    |rg == 10 = ("Cassino Silva", 43, 'm')

type Dados = (String, Float, Char)

idade::Dados->Float
idade (nome,id,sexo) = id

somaidade::Float->Float
somaidade index
    |index == 1 = (idade (pessoa 1))
    |otherwise = idade (pessoa index) + somaidade (index-1)
    

mediaidade::Float->Float
mediaidade n = (somaidade n) / n
    
fatorial::Integer->Integer
fatorial a = product [1..a]

fstlst::[Int]->(Int,Int)
fstlst [] = (0,0)
fstlst lista = ((head lista),(last lista))

cutstr::String->String
cutstr xs
    | length xs <= 2 = ""
    | otherwise = init(tail xs)

k_elemento::Int->[a]->a
k_elemento _ [] = error "Lista Vazia"
k_elemento _ [a] = a
k_elemento n (x:xs) 
    | n <= 1 = x
    | otherwise = k_elemento (n-1) xs

insere::(Eq a)=>a->[a]->[a]
insere a xs
    | a `elem ` xs = xs
    | otherwise = xs ++ [a]

insere'::(Eq a)=>a->[a]->[a]
insere' s [] = [s]
insere' s (x:[]) = (x:[]) ++ [s]
insere' s (x:xs)
    | s == x = (x:xs)
    | otherwise = (x:insere' s xs)

ispalind::(Eq a)=>[a]->Bool
ispalind xs = xs == reverse xs

maior::(Ord a)=>[a]->a
maior [] = error "Lista vazia"
maior [a] = a
maior (x:xs)
    | x >= head xs = maior (x:tail xs)
    | otherwise = maior xs
