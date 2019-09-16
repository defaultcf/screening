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

class JoinScreening < ApplicationRecord
  belongs_to :screening
  belongs_to :user

  validates :user, uniqueness: {
    scope: :screening,
    message: "既に参加を表明しています",
  }
end
