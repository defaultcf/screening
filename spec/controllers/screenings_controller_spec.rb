require "rails_helper"

RSpec.describe ScreeningsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Screening. As you add validations to Screening, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      "manager": user,
      "title": "MyTitle",
      "body": "MyBody",
    }
  }

  let(:invalid_attributes) {
    {
      "manager": user,
      "title": random_str(100),
      "body": random_str(400),
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScreeningsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:screening) { FactoryBot.create(:screening) }
  let(:old_screening) { FactoryBot.create(:old_screening) }
  let(:user) { screening.manager }
  let(:user2) { FactoryBot.create(:user) }
  before do
    login_user user
  end

  # after do
  #   sign_out user
  # end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: screening.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: screening.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Screening" do
        expect {
          post :create, params: { screening: valid_attributes }
        }.to change(Screening, :count).by(1)
      end
    end

    context "with invalid params" do
      it "can't create" do
        expect {
          post :create, params: { screening: invalid_attributes }
        }.to change(Screening, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title: "MyTitle2",
          body: "MyBody2",
        }
      }

      it "updates the requested screening" do
        put :update, params: { id: screening.id, screening: new_attributes }
        screening.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the screening" do
        put :update, params: { id: screening.id, screening: valid_attributes }
        expect(response).to redirect_to(screening)
      end
    end

    context "with invalid params" do
      it "can't update" do
        put :update, params: { id: screening.id, screening: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested screening" do
      expect {
        delete :destroy, params: { id: screening.id }
      }.to change(Screening, :count).by(-1)
    end

    it "redirects to the screenings list" do
      delete :destroy, params: { id: screening.id }
      expect(response).to redirect_to(screenings_url)
    end
  end

  describe "POST #join" do
    before do
      login_user user2
    end

    it "参加表明が為される" do
      expect {
        post :join, params: { id: screening.id, message: "hello" }
      }.to change(JoinScreening, :count).by(1)
    end

    it "上映時間を過ぎたため参加表明できない" do
      expect {
        post :join, params: { id: old_screening.id, message: "Can I join it??" }
      }.to change(JoinScreening, :count).by(0)
    end
  end

  describe "DELETE #join_cancel" do
    before do
      login_user user2
      JoinScreening.create(screening: screening, user: user2)
    end

    it "参加表明をキャンセルする" do
      expect {
        delete :join_cancel, params: { id: screening.id }
      }.to change(JoinScreening, :count).by(-1)
    end
  end
end
