def diga_ola(nome)
  puts "Olá, " + nome
end

diga_ola("Albert")

#Não precisa informar o return no método, só passar direto no final da instrução o que deve ser retornado
def retorna_nome
  "Albert"
end

resultado = retorna_nome
puts resultado

def soma(v1, v2)
  total = v1 + v2
  total
end

res = soma(10, 25)
puts res
