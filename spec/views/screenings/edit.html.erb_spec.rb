require "rails_helper"

RSpec.describe "screenings/edit", type: :view do
  before do
    @user = FactoryBot.build(:user)
    @screening = assign(:screening, Screening.create!(
                                      manager: @user,
                                      title: "MyString",
                                      content: "MyString",
                                      showing_start: Time.zone.now + 7.days,
                                    ))
  end

  it "renders the edit screening form" do
    render

    assert_select "form[action=?][method=?]", screening_path(@screening), "post" do
      assert_select "input[name=?]", "screening[title]"
    end
  end
end
