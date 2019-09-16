# == Schema Information
#
# Table name: join_screenings
#
#  id           :bigint(8)        not null, primary key
#  screening_id :uuid             not null
#  user_id      :bigint(8)        not null
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :join_screening do
    screening { nil }
    user { nil }
    message { "MyString" }
  end
end
