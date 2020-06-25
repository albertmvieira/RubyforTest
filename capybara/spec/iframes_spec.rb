describe "iframes", :iframes do
  describe "bom", :nice_iframe do
    before(:each) do
      visit "/nice_iframe"
    end

    it "adicionar ao carrinho" do
      #   recurso do capybrara para trabalhar com iframe - elemento precisa ter id ou nome
      within_frame("burgerId") do
        produto = find(".menu-item-info-box", text: "REFRIGERANTE")
        produto.find("a").click
        expect(find("#cart")).to have_content "R$ 4,50"
        sleep 4
      end
    end
  end

  describe "ruim", :bad_iframe do
    before(:each) do
      visit "/bad_iframe"
    end

    it "carrinho deve estar vazio" do

      #   adicionar id temporário para o elemento (se der refresh na página o id morre, pois é local)
      script = '$(".box-iframe").attr("id", "tempId");'
      page.execute_script(script)

      within_frame("tempId") do
        expect(find("#cart")).to have_content "Seu carrinho está vazio"
        sleep 3
      end
    end
  end
end
