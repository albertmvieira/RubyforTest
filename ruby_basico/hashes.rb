#hash é um objeto que possui uma coleção de dados (chave e valor)

carro = Hash[nome: "Civic", marca: "Honda", cor: "Prata"]

#imprimir pela chave
puts carro[:marca]
puts carro.class

#inserindo mais uma chave e valor no hash
carro[:modelo] = "SI"

puts carro
