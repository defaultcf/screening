class UserProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_profile, except: [:show]

  def show
    @profile = UserProfile.find_by!(username: params[:name])
  end

  def edit
  end

  def update
  end

  private

    def set_current_profile
      @profile = current_user.profile
    end
end
