FactoryBot.define do
  factory :offer do
    salesman { create(:salesman) }
    client { create(:client) }
    quantity { 250 }
    width { 50 }
    height { 60 }
    length { 70 }
  end
end
