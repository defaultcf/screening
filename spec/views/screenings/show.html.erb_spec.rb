require "rails_helper"

RSpec.describe "screenings/show", type: :view do
  before do
    @user = FactoryBot.build(:user)
    @screening = assign(:screening, Screening.create!(
                                      manager: @user,
                                      title: "Title",
                                      body: "MyText",
                                    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
