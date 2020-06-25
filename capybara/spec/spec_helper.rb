require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  config.before(:example) do
    # Redimensionando a tela para resolução mínima, atendendo a maioria dos clientes
    page.current_window.resize_to(1366, 768)
  end

  config.after(:example) do |e|
    # e.description - pega o nome do cenário sendo executado
    # gsub - metodo de substring do ruby passando regex para trocar caracteres especias por nada
    # tr - metodo ruby para trocar espaço em branco por alguma coisa
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, "").tr(" ", "_")
    page.save_screenshot("log/" + nome + ".png") if e.exception
    # comentado if que tira screenshot apenas quando teste falha
    # e.exception - metodo exception do ruby mostra a exceção da execução do cenário
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.default_max_wait_time = 5
  config.app_host = "https://training-wheels-protocol.herokuapp.com"
end
