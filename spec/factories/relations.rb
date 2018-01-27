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
# Foreign Keys
#
#  fk_rails_...  (followed_id => users.id)
#  fk_rails_...  (follower_id => users.id)
#

FactoryBot.define do
  factory :relation do
    follower { FactoryBot.build(:user) }
    followed { FactoryBot.build(:user) }
  end
end
