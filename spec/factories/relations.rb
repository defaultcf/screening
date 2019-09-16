# == Schema Information
#
# Table name: relations
#
#  id          :bigint(8)        not null, primary key
#  follower_id :bigint(8)
#  followed_id :bigint(8)
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
