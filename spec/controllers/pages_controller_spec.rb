require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe "GET#index" do
    subject { get :index }

    it "レスポンスが200" do
      is_expected.to have_http_status(200)
    end
  end

  describe "GET#dashboard" do
    subject { get :dashboard }

    context "未ログインの時" do
      it "ログイン画面に遷移する" do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
end
