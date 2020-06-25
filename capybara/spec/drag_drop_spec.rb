describe "Drag and Drop", :drop do
  before(:each) do
    visit "/drag_and_drop"
  end

  it "homem aranha pertence ao time do Stark" do
    stark = find(".team-stark .column")
    cap = find(".team-cap .column")
    spiderman = find("img[alt$=Aranha]")

    # drag_to - recurso do capybara para arrastar o elemento para outra area draggable
    spiderman.drag_to stark

    #have_css verifica se o elemento tem o css
    expect(stark).to have_css "img[alt$=Aranha]"
    expect(cap).not_to have_css "img[alt$=Aranha]"
  end

  after(:each) do
    sleep 3
  end
end
