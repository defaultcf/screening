# == Schema Information
#
# Table name: screenings
#
#  id            :uuid             not null, primary key
#  manager_id    :bigint(8)        not null
#  title         :string           not null
#  body          :text
#  showing_start :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (manager_id => users.id)
#

require "rails_helper"

RSpec.describe Screening, type: :model do
  let(:user) { FactoryBot.build(:user) }

  context "正常な字数が入力された時" do
    it "正常に作成される" do
      screening = Screening.new(
        manager: user,
        title: random_str(20),
        body: random_str(100),
      )
      expect(screening).to be_valid
    end
  end

  context "異常な字数が入力された時" do
    it "作成されない" do
      screening = Screening.new(
        manager: user,
        title: random_str(100),
        body: random_str(400),
      )
      expect(screening).to be_invalid
    end
  end
end
