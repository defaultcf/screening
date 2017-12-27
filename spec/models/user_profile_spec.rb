# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  username   :string           not null
#  nickname   :string
#  avatar     :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe UserProfile, type: :model do
  let(:user) { FactoryBot.build(:user) }

  context "何を入力しても" do
    before do
      user.profile.username = "koume"
      user.profile.nickname = "小梅"
      user.profile.avatar = "可愛いゾンビ"
      user.profile.bio = "ゾンビ大好き💓"
      user.profile.save
    end

    it "だいじょうV" do
      expect(user.profile).to be_valid
    end
  end
end
