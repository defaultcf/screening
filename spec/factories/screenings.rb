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
    title "MyString"
    body "MyText"
    showing_start "2018-01-27 21:29:35"
  end
end
