describe "Forms", :smoke do
  it "Login com sucesso" do
    visit "/login"

    fill_in "userId", with: "stark"
    fill_in "password", with: "jarvis!"
    click_button "Login"

    expect(find("#flash").visible?).to be true
    #verifica se o texto está contido no texto do elemento capturado
    expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"
    #verifica se o conteudo esta no elemento (mais utilizado)
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "Senha Incorreta", :temp do
    visit "/login"
    fill_in "userId", with: "stark"
    fill_in "password", with: "xpto123!"
    click_button "Login"

    expect(find("#flash")).to have_content "Senha é invalida!"
  end

  it "Usuário não Cadastrado" do
    visit "/login"
    fill_in "userId", with: "Marvel"
    fill_in "password", with: "xpto123!"
    click_button "Login"

    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!"
  end
end
