# Ruby e uma linguagem considerada puramente orientada a objeto
# Porque no Ruby tudo são objetos

#Classe

class Carro
  #Atributo da classe
  attr_accessor :nome

  def ligar
    puts "O Carro esta pronto para iniciar o trajeto"
  end
end

#Instacia da classe (objeto)
civic = Carro.new
civic.nome = "civic"

puts civic.nome
civic.ligar
