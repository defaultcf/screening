# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  username   :string
#  nickname   :string
#  avatar     :string
#  intro      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_profile do
    user nil
    username "MyString"
    nickname "MyString"
    avatar "MyString"
  end
end
