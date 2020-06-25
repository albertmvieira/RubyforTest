describe "Tables", :tables, :smoke do
  before(:each) do
    visit "/tables"
  end

  it "deve exibir o salario do Tony Stark" do

    # pega todos os elementos igual o finds do java
    atores = all("#actors tbody tr")
    # detect é um recurso do ruby parecido com foreach que procura em toda a lista
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }
    expect(stark.text).to include "10.000.000"
  end

  #   Find do capybara possui um recurso que pode pedir o texto do css - dessa forma já pega a linha que contém o texto a ser validado alguma informação
  it "deve exibir o salario do Vin Diesel" do
    diesel = find("#actors tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "10.000.000"
  end

  #   utilizando o texto no find
  it "deve exibir o filme velozes com have_content" do
    diesel = find("#actors tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "Fast & Furious"
  end

  #   Utilizando o css com seletor da coluna
  it "deve exibir o filme velozes na coluna exata" do
    diesel = find("#actors tbody tr", text: "@vindiesel")
    movie = diesel.all("td")[2].text

    expect(movie).to eql "Velozes e Furiosos"
  end

  it "deve exibir o insta do Chris Evans" do
    evans = find("#actors tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text
    expect(insta).to eql "@teamcevans"
  end

  it "deve selecionar Chris Pratt para remoção" do
    prat = find("#actors tbody tr", text: "Chris Pratt")
    prat.find("a", text: "delete").click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "deve selecionar Chris Pratt para edição" do
    prat = find("#actors tbody tr", text: "Chris Pratt")
    prat.find("a", text: "edit").click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Chris Pratt foi selecionado para edição!"
  end

  after(:each) do
    sleep 1
  end
end
