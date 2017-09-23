Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: "pages#dashboard"

  get "@:name", to: "user_profile#show"
  get "user_profile/edit"

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
