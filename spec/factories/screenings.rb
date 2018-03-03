# == Schema Information
#
# Table name: screenings
#
#  id            :uuid             not null, primary key
#  manager_id    :integer          not null
#  title         :string           not null
#  body          :text             not null
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
    title "けものフレンズ上映会"
    body "たーのしー！"
    showing_start Date.current + 7.day
  end

  factory :old_screening, class: Screening do
    manager { FactoryBot.build(:user) }
    title "真夏の夜の淫夢"
    body "ｱｯーー"
    showing_start Date.current - 7.day
  end
end
