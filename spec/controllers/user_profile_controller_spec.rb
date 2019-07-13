require "rails_helper"

RSpec.describe UserProfileController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:params) { { name: User.find(user.id).profile.username } }

  describe "GET #index" do
    before do
      login_user user
    end

    it "ログインしているユーザのページに飛ぶ" do
      get :index
      expect(response).to redirect_to(user_profile_show_url(params))
    end
  end

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

  describe "POST #update" do
    subject {
      put :update, params: { user_profile: { bio: "ふへへ" } }
    }

    context "ログイン状態の時" do
      before do
        login_user user
      end

      it "正しいパラメータが与えられた時" do
        expect(subject).to have_http_status :found
      end
    end
  end
end
