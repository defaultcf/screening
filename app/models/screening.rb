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

class Screening < ApplicationRecord
  belongs_to :manager, class_name: "User"
  has_many :join_screenings, dependent: :destroy
  has_many :members, through: :join_screenings, source: :user
  has_rich_text :content

  validates :title, length: { maximum: 30 }
end
