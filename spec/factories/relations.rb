# == Schema Information
#
# Table name: relations
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :relation do
    follower { FactoryBot.build(:user) }
    followed { FactoryBot.build(:user) }
  end
end
