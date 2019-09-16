# == Schema Information
#
# Table name: user_profiles
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  username   :string           not null
#  nickname   :string
#  avatar     :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :user_profile do
    sequence(:username) {|n| "koume-#{n}" }
    nickname { "zombie lover" }
    avatar { "zombieee" }
    bio { "I love zombie💓" }
  end
end
