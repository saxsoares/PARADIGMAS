cubo::Float->Float
cubo lado = lado ** 3 

potencia_2::Float->Float
potencia_2 x = x * x

potencia_4::Float->Float
potencia_4 x = (potencia_2 x) ** 2

menor::Int->Int->Int
menor x y
    | x < y = x
    |otherwise = y

compara1::Int->Int->Int->String
compara1 x y z
    | x == y && x == z = "Todos iguais"
    | x == y = " Dois primeiros sao iguais "
    | x == z = " Primeiro igual a ultimo "
    | y == z = " Dois Ultimos sao iguais "
    | otherwise = "Diferentes"

fibonnacci::Int->Int
fibonnacci n
    | n == 1 = 1
    | n == 2 = 1
    |otherwise = fibonnacci (n-1) + fibonnacci (n-2)

doubleSmallN x = if x > 100
                    then x
                    else x * 2

parImpar lista = [ if not(odd x) then "par" else "impar" | x <- lista ]

combinalistas x y = [ a*b | a<-x, b<-y]

verificaTriangulo::(Int,Int,Int)->String
verificaTriangulo (a,b,c) = if (a,b,c) `elem` [(x,y,z) | x <- [1..b], y <- [1..c], z<-m, x^2 + y^2 == c^2, x+y+z == 24 ]
                            then "T"
                            else "N"
                            where m = [1..10]

lucky::(Integral a)=>a->String
lucky 4 = "asd"
lucky x = "mentira"

fatorial::(Integral a)=>a->a
fatorial 0 = 1
fatorial n = n * fatorial(n-1)

integral'::(Integral a)=>a->a
integral' n = n

integer'::a->a
integer' n = n

num::(Num a, Integral b)=>b->a
num a = fromIntegral a


number'::(Num a)=>a->String
number' n  = "n"
    
    

tell::(Show a)=>[a]->String
tell [] = "Lista vazia"
tell (x:[]) = "Um elemento: " ++ show x
tell (x:y:[]) = "Dois elementos: " ++ show x ++ ", " ++ show y
tell (x:y:_) = "grande: " ++ show x ++ ", " ++ show y

funcao::(Show a)=>[a]->String
funcao xs = case xs of  [] -> "Vazia"
                        (x:[]) -> "um elemento"
                        (x:xs) -> "Primeiro elemento " ++ show x

length' xs = sum [1 | _<-xs ]

bmiTell::(RealFloat a)=>a->a->a
bmiTell peso alt = peso / alt^2

calcBmi::(RealFloat a)=>[(a,a)]->[a]
calcBmi lista  = [ let bmi = w/h^2 in bmi  | (w, h)<-lista]
  
myLast::[a]->a
myLast [] = error "Lista vazia"
myLast (x:[]) = x
myLast (x:xs) = myLast xs

maximum'::(Ord a)=>[a]->a
maximum' [] = error "Lista vazia"
maximum'[a] = a
maximum' (x:xs)
    | x > maximum' xs = x
    | otherwise = maximum' xs

replicate'::(Num i, Ord i)=>i->a->[a]
replicate' n a 
    |n <= 0 = []
    |otherwise = a : replicate' (n-1) a

take'::(Num i, Ord i)=>i->[a]->[a]
take' n _
    | n <= 0 = []
take' n [] = []
take' n (x:xs) = x: take' (n-1) xs

zip'::[a]->[b]->[(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem'::(Eq a)=>a->[a]->Bool
elem' _ [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = elem' a xs

quicksort::(Ord a)=>[a]->[a]
quicksort [] = []
quicksort (x:xs) =
    let left = quicksort [a | a <- xs, a <= x]
        right = quicksort [a | a <- xs, a > x]
    in left ++ [x] ++ right    
   
mult3::(Num a)=> a -> a -> a -> a
mult3 a b c = a * b * c

mult2 = mult3 9

compara100::(Num a, Ord a)=>a->Ordering
compara100 = compare 100

funcfunc::(a->a)->a->a
funcfunc f x = f (f x)

zipWith'::(a->b->c)->[a]->[b]->[c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (a:as) (b:bs) = f a b : zipWith' f as bs

flip'::(a->b->c)->(b->a->c)
flip' f x y = f y x

maxi::(Ord a)=>[a]->a
maxi [] = error "Lista Vazia"
maxi [a] = a
maxi (x:xs) = foldr1 (\a b->(max a b)) (x:xs)
   
bublesort::[Int]->[Int]
bublesort [] = []
bublesort (x:[]) = [x]
bublesort lista = ( foldl1 (\a b->(min a b)) lista :( bublesort [x|x<-lista, x/=(minimum lista)] ) )




