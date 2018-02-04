require "rails_helper"

RSpec.describe UserProfileController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:params) { { name: User.find(user.id).profile.username } }

  describe "GET #show" do
    subject { get :show, params: params }

    context "存在するnameでアクセスした時" do
      it_behaves_like "200が返る"
    end
  end

  describe "GET #edit" do
    subject { get :edit, params: params }

    context "存在するnameでアクセスした時" do
      it_behaves_like "ログイン画面に遷移する"
    end
  end
end
