soma::(Int,Int)->Int->(Int,Int)
soma (x,y) i = (x+i, y+i)

pessoa::Float->(String, Float, Char)
pessoa rg
	|rg == 1 = ("Joao Silva",12,'m')
	|rg == 2 = ("Maria Santos",30,'f')
	|rg == 3 = ("Jonas Souza",51,'m')
	|rg == 4 = ("Silvia Cardoso",15,'f')
	|rg == 5 = ("Jose Coelho",64,'m')
	|rg == 6 = ("Manoel Pontes",19,'m')
	|rg == 7 = ("Joao Carvalho",13,'m')
	|rg == 8 = ("Marcia Santana",37,'f')
	|rg == 9 = ("Cassia Martinez",21,'f')
	|rg ==10 = ("Cassino Silva",43,'m')

type Dados=(String,Float,Char)

idade::Dados->Float
idade (nome,idade,sexo)=idade

sexo::Dados->Char
sexo (nome, idade, sexo) = sexo

isman::Char->Float
isman sexo
	|sexo == 'm' = 1
	|sexo == 'f' = 0

somaidade::Float->Float
somaidade index
	|index == 1 = idade(pessoa 1)
	|otherwise = idade(pessoa index) + somaidade(index - 1)

idademedia::Float->Float
idademedia index = (somaidade index)/index

contahomem::Float->Float
contahomem index
	|index == 1 = 1
	|otherwise = isman(sexo(pessoa index)) + contahomem(index-1)
 
dadosdemaior::Float->Dados
dadosdemaior index
	|idade(pessoa index) >= 18 = pessoa index
	|otherwise = dadosdemaior(index - 1)
