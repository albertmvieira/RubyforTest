class Conta
  attr_accessor :saldo, :nome

  #initialize = Contrutor da classe
  def initialize(nome)
    self.saldo = 0.0
    self.nome = nome
  end

  def deposita(valor)
    puts valor.class
    self.saldo += valor #self para acessar os atributos da própria classe dentro do método = "this" no java
    # puts "Depositando a quantia de " + valor.to_s + " reais."
    puts "Depositando a quantia de #{valor} reais na conta de #{self.nome}." #interpolação de strings faz a conversão automatica para string
  end
end

# Intanciando a classe conta passando o parametro nome, que é obrigatório no construtor
c = Conta.new("Albert")

c.deposita(100.00)
puts "Saldo da conta: #{c.saldo}"

c.deposita(10.00)
puts "Saldo atual da conta: #{c.saldo}"
puts c.nome
