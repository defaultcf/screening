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

FactoryBot.define do
  factory :screening do
    manager { FactoryBot.build(:user) }
    title { "けものフレンズ上映会" }
    body { "たーのしー！" }
    showing_start { Time.zone.now + 7.day }
  end

  factory :old_screening, class: Screening do
    manager { FactoryBot.build(:user) }
    title { "真夏の夜の淫夢" }
    body { "ｱｯーー" }
    showing_start { Time.zone.now - 7.days }
  end
end
