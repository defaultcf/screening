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

require "rails_helper"

RSpec.describe User, type: :model do
  context "正常な入力がされた時" do
    let(:user) do
      User.new(
        email: "koume@346.pro",
        password: "password",
        password_confirmation: "password",
      )
    end

    it "正常にユーザーが作成される" do
      expect(user).to be_valid
    end

    it "UserProfileが同時に作成される" do
      user.save!
      expect(user.profile).not_to eq nil
    end
  end

  context "指定されたドメイン以外のメールアドレスが入力された時" do
    let(:user) do
      User.new(
        email: "koume@example.com",
        password: "password",
        password_confirmation: "password",
      )
    end

    it "エラーが発生してユーザーが作成されない" do
      expect(user).to be_invalid
    end
  end
end
