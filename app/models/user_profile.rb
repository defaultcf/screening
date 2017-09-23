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

class UserProfile < ApplicationRecord
  belongs_to :user
end
