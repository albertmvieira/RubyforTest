class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

#TDD (Desenvolvimento guiado por testes)
describe AvengersHeadQuarter do
  it "deve adicionar um vingador" do
    hq = AvengersHeadQuarter.new

    hq.put("Spiderman")
    expect(hq.list[0]).to eql "Spiderman" # pegando a posição do array e comparando strings
    expect(hq.list[0]).to include "Spiderman" # validando que texto existe dentro da lista
    expect(hq.list).to eql ["Spiderman"] # comparando o array todo
  end

  it "deve adicionar uma lista de vingadores" do
    hq = AvengersHeadQuarter.new
    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")
    expect(hq.list).to include "Thor" # validando que texto existe dentro da lista
    expect(hq.list.size).to be > 0 # validando que a lista "array" esta com o tamanho correto

    res = hq.list.size > 0 #incluindo na variavel res o valor true or false (boolean)
    expect(res).to be true # validando que o retorno é true
  end

  it "Thor deve ser o primeiro da lista" do
    hq = AvengersHeadQuarter.new
    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")

    expect(hq.list).to start_with("Thor")
  end

  it "IronMan deve ser o ultimo da lista" do
    hq = AvengersHeadQuarter.new
    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")
    hq.put("IronMan")

    expect(hq.list).to end_with("IronMan")
  end

  it "deve conter o sobrenome" do
    avenger = "Peter Parker"

    expect(avenger).to match(/Parker/) #validando se string contain caracteres
    expect(avenger).not_to match(/Bug/) #validando se string não contém caracteres
  end
end
