require "rails_helper"

RSpec.describe PagesController, type: :controller do
  let(:user) { FactoryBot.build(:user) }

  describe "GET#index" do
    subject { get :index }

    it "レスポンスが200" do
      is_expected.to have_http_status(200)
    end
  end

  describe "GET#dashboard" do
    subject { get :dashboard }

    context "未ログインの時" do
      it_behaves_like "ログイン画面に遷移する"
    end

    context "ログイン済みの時" do
      before do
        login_user user
      end

      after do
        sign_out user
      end

      it "レスポンスが200" do
        is_expected.to have_http_status(200)
      end
    end
  end
end
