Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: "pages#dashboard"

  resources :screenings

  get "@:name", to: "user_profile#show", as: "user_profile_show"
  get "user_profile/edit"
  match "user_profile/update", via: [:post, :patch]

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  authenticate :user, ->(u) { u.is_admin? } do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
