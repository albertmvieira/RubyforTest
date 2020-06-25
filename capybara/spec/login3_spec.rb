describe "Login 3 - Com Cadastro", :login3 do
  before(:each) do
    visit "/access"
  end

  it "login com sucesso com busca do elemento pai", :smoke do
    login_form = find("#login")
    login_form.find("input[name=username]").set "stark"
    login_form.find("input[name=password]").set "jarvis!"

    click_button "Entrar"

    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "login com sucesso com metodo within" do

    # metodo do capybara que trabalhará com atributos dentro de um elemento identificado
    within("#login") do
      find("input[name=username]").set "stark"
      find("input[name=password]").set "jarvis!"
      click_button "Entrar"
    end

    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "Cadastro com sucesso com metodo within" do

    # metodo do capybara que trabalhará com atributos dentro de um elemento identificado
    within("#signup") do
      find("input[name=username]").set "stark"
      find("input[name=password]").set "jarvis!"
      click_link "Criar Conta"
    end

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
