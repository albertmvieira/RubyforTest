describe "Upload", :upload do
  before(:each) do
    # Dir.pwd - pega o path/diretório raiz
    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt"
    @imagem = Dir.pwd + "/spec/fixtures/Junit.png"
    visit "/upload"
  end

  it "Upload com arquivo texto" do
    # attach_file - funcionalidade de upload nativa do capybara
    attach_file("file-upload", @arquivo)
    click_button "Upload"

    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo.txt"
  end

  it "Upload de imagem", :upload_imagem do
    attach_file("file-upload", @imagem)
    click_button "Upload"

    img = find("#new-image")
    # verifica se no atributo src da imagem contem o valor img[:src]
    expect(img[:src]).to include "/uploads/Junit.png"
  end

  after(:each) do
    sleep 3
  end
end
