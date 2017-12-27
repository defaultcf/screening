require "rails_helper"

RSpec.describe UserProfileController, type: :controller do
  let(:user) { FactoryBot.build(:user) }

  describe "GET #show" do
    subject { get :show, params: params }

    context "存在するnameでアクセスした時" do
      let(:params) { { name: user.profile.nickname } }
      it_behaves_like "ログイン画面に遷移する"
    end

    context "存在しないnameでアクセスした時" do
      let(:params) { { name: "sachiko" } }
      it_behaves_like "ログイン画面に遷移する"
    end
  end

  describe "GET #edit" do
    subject { get :edit, params: params }

    context "存在するnameでアクセスした時" do
      let(:params) { { name: user.profile.nickname } }
      it "ログイン画面に遷移する" do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
end
