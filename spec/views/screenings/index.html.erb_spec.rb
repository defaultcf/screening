require "rails_helper"

RSpec.describe "screenings/index", type: :view do
  before do
    @user = FactoryBot.build(:user)
    assign(:screenings, [
      Screening.create!(
        manager: @user,
        title: "Title",
        body: "MyText",
      ),
      Screening.create!(
        manager: @user,
        title: "Title",
        body: "MyText",
      ),
    ])
  end

  it "renders a list of screenings" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
