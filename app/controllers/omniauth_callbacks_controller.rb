class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(@auth)
    session["twitter_token"]  = @auth["credentials"]["token"]
    session["twitter_secret"] = @auth["credentials"]["secret"]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
