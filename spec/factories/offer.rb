FactoryBot.define do
  factory :offer do
    salesman { create(:salesman) }
    client { create(:client) }
    quantity { 50 }
  end
end
