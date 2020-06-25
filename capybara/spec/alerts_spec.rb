describe "Alertas de JS", :alerts do
  before(:each) do
    visit "/javascript_alerts"
  end

  #   Sleeps apenas para visualizar na tela (apenas acadêmico)

  it "alerta", :smoke do
    click_button "Alerta"

    # mudando para janela/componente js alert
    msg = page.driver.browser.switch_to.alert.text
    puts msg
    expect(msg).to eql "Isto é uma mensagem de alerta"
    sleep 3
  end

  it "sim confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"
    sleep 2
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Mensagem confirmada"
    sleep 2
  end

  it "não confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"
    sleep 2
    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content "Mensagem não confirmada"
    sleep 2
  end

  it "accept prompt", :accept_prompt do
    # aceitar prompt js quando clicar no botão
    accept_prompt(with: "Albert") do
      click_button "Prompt"
      sleep 2
    end

    expect(page).to have_content "Olá, Albert"
    sleep 3
  end

  it "dismiss prompt", :dismiss_prompt do
    # aceitar prompt js quando clicar no botão
    dismiss_prompt(with: "Albert") do
      click_button "Prompt"
      sleep 2
    end

    expect(page).to have_content "Olá, null"
    sleep 3
  end
end
