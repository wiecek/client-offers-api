FactoryBot.define do
  factory :admin do
    email { generate(:user_email) }
    password { 'password' }
  end
end
