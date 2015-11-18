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
insere' s [x]
    | s == x = [x]
    | otherwise = x:[s]
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

maior'::(Ord a)=>[a]->a
maior' [x] = x
maior' xs = foldl1 (\a b->(max a b)) xs

derivada::(Float,Float)->Float->Float
derivada (a,ex) 0 = 0
derivada (0,_) _ = 0
derivada (a,0) x = 0
derivada (a,ex) x = ex*a * (x **(ex-1))

calcDerivada::[(Float,Float)]->Float->Float
calcDerivada [] _     = 0
calcDerivada (a:[]) x = derivada a x
calcDerivada (a:as) x = derivada a x + calcDerivada as x

fac::Float->Float
fac 0 = 1
fac n = product [1..n]

aprox::Float->Float
aprox n = sum [1 / (fac x)| x<-[0..n]]

quicksort::(Ord a)=>[a]->[a]
quicksort [] = []
quicksort (x:xs)  = 
    let left =  [a | a<-xs,a<=x]
        right=  [a | a<- xs, a > x]
    in quicksort left ++ [x] ++ quicksort right

insertionSort::(Ord a)=>[a]->[a]
insertionSort = foldr insertOrd []

insertOrd::(Ord a)=>a->[a]->[a]
insertOrd x [] = [x]
insertOrd x (y:ys)
    | x <= y = (x:y:ys)
    |otherwise = y:(insertOrd x ys)

tirarep::(Eq a)=>[a]->[a]
tirarep [] = []
tirarep [x] = [x]
tirarep (x:xs) = (x:tirarep [a | a<-xs, a/=x])

geraComb::Int->[a]->[[a]]
geraComb 0 _ = []
geraComb 1 s = [ [x] | x<- s ] 
geraComb n s = [ x:xs | x <- s, xs<-( geraComb (n-1) s) ] 

geraComb' = geraComb 4 [1,0]

geraComb'' = [[a,b,c,d]| a<-"10",b<-"10",c<-"10",d<-"10"]

geraComb'''::Int->[String]
geraComb''' 1 = ["1","0"]
geraComb''' n = [(x:xs)| x<-"10",xs<-geraComb''' (n-1) ]

ordena::(Ord a)=>[a]->[a]
ordena [] = []
ordena [a] = [a]
ordena (x:xs) = ordena left ++ [x] ++ ordena right
    where left = [ a | a<-xs, a <= x]
          right = [ a | a<-xs,  a > x ]

pos::(Eq a)=>a->[a]->Int
pos a [] = 0
pos a (x:xs)
    |not(a `elem` (x:xs)) = 0
    |x == a = 1
    |otherwise =  1 + pos a xs

maior2::(Ord a)=>[a]->(a,Int)
maior2 [a] = (a,1)
maior2 (x:xs) = (maximum (x:xs), pos (maximum (x:xs)) (x:xs)) 


tuplatodos::a->[b]->[(a,b)]
tuplatodos a lb = zip (repeat a) lb

myMap::(a->b)->[a]->[b]
myMap _ [] = []
myMap f (x:xs) = (f x):(myMap f xs)

retiraext::String->String
retiraext "" = ("")
retiraext str = uncurry const (span (\a->a /= '.') str)

paresEntre::Int->Int->[Int]    
paresEntre x y = [ a^2 | a <- pares ]
    where pares = [ xx | xx <- [x..y], (xx `mod` 2) == 0]
    
paresEntre'::Int->Int->[Int]
paresEntre' a b = 
    let pares = [ xx | xx <- [a..b], (xx `mod` 2) == 0]
    in [ paq | paq <- pares]

rotEsq::[a]->[a]
rotEsq [] = []
rotEsq [a] = [a]
rotEsq (x:xs) = xs++[x]

rotacaoEsq::Int->[a]->[a]
rotacaoEsq 0 l = l
rotacaoEsq n l = rotacaoEsq (n-1) (rotEsq l)

f1::Int->[Int]
f1 x = [ a | a<-[1000..1100], (a `mod` x) /= 0]

elimina_n::(Eq a)=>Int->[a]->[a]
elimina_n _ [] = []
elimina_n n xs = [ x | x <- xs, x /= (xs!!(n+1))]

cutList::(Eq a)=>Int->Int->[a]->[a]
cutList _ _ [] = []
cutList i j xs
    | i >= length xs = []
    | i >= j = []
    | j >= length xs = drop (i-1) xs
    |otherwise =drop (i-1) (take j xs)  

insertSort::(Ord a)=>[a]->[a]
insertSort = foldl insertO []

insertO::(Ord a)=>[a]->a->[a]
insertO [] a = [a]
insertO (x:xs) a
    |a <= x = (a:x:xs)
    |otherwise = x:(insertO xs a)

expo::(Num a,Enum a, Fractional a, Floating a, Eq a)=>a->a->a
expo 0 _ = 1
expo x n = (x ** n)/product [1..n]


taylor::(Num a, Enum a, Fractional a, Floating a, Eq a)=>a->a->a
taylor x n = foldl1 (\a b->a+b) [expo x b | b<-[0..n]]

filtro::Int->Int->[Int]->[Int]
filtro x y xs = filter (\a->(a>x && a<y)) xs

auxDuplica::Int->[Int]->[Int]
auxDuplica 0 [] = []
auxDuplica n xs = replicate n n ++ xs

duplica::[Int]->[Int]
duplica [] = []
duplica xs = foldr auxDuplica [] xs





















