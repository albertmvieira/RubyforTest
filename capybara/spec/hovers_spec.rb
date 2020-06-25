describe "Mouse Hover", :hovers do
  before(:each) do
    visit "/hovers"
  end

  it "quando passo o mouse sobre o blade" do
    card_blade = find("img[alt*=Blade]")
    # metodo para fazer mouse hover no elemento
    card_blade.hover

    expect(page).to have_content "Nome: Blade"
  end

  it "quando passo o mouse sobre o Pantera Negra" do
    card_blade = find("img[alt^=Pantera]")
    # metodo para fazer mouse hover no elemento
    card_blade.hover

    expect(page).to have_content "Nome: Pantera Negra"
  end

  it "quando passo o mouse sobre o Homem Aranha" do
    card_blade = find("img[alt$=Aranha]")
    # metodo para fazer mouse hover no elemento
    card_blade.hover

    expect(page).to have_content "Nome: Homem Aranha"
  end

  #   Regex com CSS Selector

  # alt^=Pantera - começa com Pantera
  # alt$=Pantera - termina com Pantera
  # alt*=Pantera - contaim Pantera

  after(:each) do
    sleep 3
  end
end
