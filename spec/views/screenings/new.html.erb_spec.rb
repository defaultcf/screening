require "rails_helper"

RSpec.describe "screenings/new", type: :view do
  before do
    @user = FactoryBot.build(:user)
    assign(:screening, Screening.new(
                         manager: @user,
                         title: "MyString",
                         content: "MyText",
                       ))
  end

  it "renders new screening form" do
    render

    assert_select "form[action=?][method=?]", screenings_path, "post" do
      assert_select "input[name=?]", "screening[title]"
    end
  end
end
