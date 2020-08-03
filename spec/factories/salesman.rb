FactoryBot.define do
  factory :salesman do
    email { generate(:user_email) }
    password { 'password' }
  end
end
