class UserProfileController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_profile, except: [:show]

  def index
    redirect_to user_profile_show_path(@profile.username)
  end

  def show
    @profile = UserProfile.find_by!(username: params[:name])
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_profile_show_path(@profile.username), notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  private

  def set_current_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:user_profile).permit(:username, :nickname, :avatar, :bio)
  end
end
