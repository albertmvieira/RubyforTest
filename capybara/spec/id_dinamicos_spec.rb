describe "IDs Dinâmicos", :id_dinamico do
  before(:each) do
    visit "/access"
  end

  it "Cadastro" do

    # metodo do capybara que trabalhará com atributos dentro de um elemento identificado
    within("#signup") do
      find("input[id$=UsernameInput]").set "stark"
      find("input[id^=PasswordInput]").set "jarvis!"
      find("a[id*=GetStartedButton]").click
      sleep 3
    end

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
