# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  username   :string           not null
#  nickname   :string
#  avatar     :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  before_save :set_nickname

  validates :username, format: {
    with: /\A\w+\z/,
    message: "半角英数字とハイフンのみ使用できます",
  }

  private

    def set_nickname
      self.nickname = self.user.email_localname if self.nickname.blank?
    end
end
