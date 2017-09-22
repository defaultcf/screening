Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: "pages#dashboard"

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
