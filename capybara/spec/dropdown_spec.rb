describe "Caixa de opções", :dropdown do
  it "Escolher item especifico simples" do
    visit "/dropdown"
    select("Loki", from: "dropdown") #precisa ter id para usar desta forma
    sleep 3 #temporário
  end

  it "Escolher item especifico com o find" do
    visit "/dropdown"
    drop = find(".avenger-list")
    drop.find("option", text: "Scott Lang").select_option
    sleep 3 #temporário
  end

  it "Escolher qualquer item", :sample do
    visit "/dropdown"
    drop = find(".avenger-list")
    #metodo all retorna um array (neste caso de elementos)
    #sample sorteia um item no array
    drop.all("option").sample.select_option
    sleep 5 #temporário
  end
end
