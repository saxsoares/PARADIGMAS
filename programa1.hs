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

