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

  validates :title, length: { maximum: 30 }, presence: true
  validates :showing_start, presence: true
  validate :expiration_showing_start

  private

  def expiration_showing_start
    if showing_start < Time.zone.now
      errors.add(:showing_start, 'cant be earlier date')
    end
  end
end
