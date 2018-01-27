require "rails_helper"

RSpec.describe "screenings/edit", type: :view do
  before do
    @screening = assign(:screening, Screening.create!(
                                      manager: nil,
                                      title: "MyString",
                                      body: "MyText",
    ))
  end

  it "renders the edit screening form" do
    render

    assert_select "form[action=?][method=?]", screening_path(@screening), "post" do
      assert_select "input[name=?]", "screening[manager_id]"

      assert_select "input[name=?]", "screening[title]"

      assert_select "textarea[name=?]", "screening[body]"
    end
  end
end
