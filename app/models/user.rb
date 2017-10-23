# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, class_name: "UserProfile"
  has_many :active_relations,  class_name: "Relation",
                               foreign_key: "follower_id",
                               dependent: :destroy
  has_many :passive_relations, class_name: "Relation",
                               foreign_key: "followed_id",
                               dependent: :destroy
  has_many :following, through: :active_relations,
                       source: :followed
  has_many :followers, through: :passive_relations,
                       source: :follower

  validates :email, format: {
    with: /\A[^@\s]+@346\.pro\z/,
    message: "346.proドメインで登録してください",
  }

  after_create :create_user_profile

  def email_localname
    self.email[/^(.+)@/, 1]
  end

  def follow(other_user)
    active_relations.create(followed: other_user)
  end

  def unfollow(other_user)
    active_relations.find_by(followed: other_user).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

    def create_user_profile
      UserProfile.create(user: self, username: SecureRandom.uuid[/^(\w+)/, 1])
    end
end
