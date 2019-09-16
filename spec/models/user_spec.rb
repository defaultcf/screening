# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#

require "rails_helper"

RSpec.describe User, type: :model do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }

  context "正常な入力がされた時" do
    let(:user_hash) { FactoryBot.attributes_for(:user) }
    let(:user) { User.new(user_hash) }

    it "正常にユーザーが作成される" do
      expect(user).to be_valid
    end

    it "UserProfileが同時に作成される" do
      user.save!
      expect(user.profile).not_to eq nil
    end
  end

  context "ユーザのフォロー周りで" do
    it "正常にフォローできる" do
      expect {
        user1.follow(user2)
      }.to change{ Relation.count }.by(1)
    end

    it "フォローしているか確認できる" do
      Relation.create(follower: user1, followed: user2)
      expect(
        user1.following?(user2)
      ).to be_truthy
    end
  end
end
