require "rails_helper"

RSpec.describe "screenings/new", type: :view do
  before do
    assign(:screening, Screening.new(
                         manager: nil,
                         title: "MyString",
                         body: "MyText",
    ))
  end

  it "renders new screening form" do
    render

    assert_select "form[action=?][method=?]", screenings_path, "post" do
      assert_select "input[name=?]", "screening[manager_id]"

      assert_select "input[name=?]", "screening[title]"

      assert_select "textarea[name=?]", "screening[body]"
    end
  end
end
