FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "koume-#{n}@346.pro" }
    password "love_zombie"
    password_confirmation "love_zombie"
  end
end
