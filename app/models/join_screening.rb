# == Schema Information
#
# Table name: join_screenings
#
#  id           :integer          not null, primary key
#  screening_id :integer          not null
#  user_id      :integer          not null
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class JoinScreening < ApplicationRecord
  belongs_to :screening
  belongs_to :user
end
