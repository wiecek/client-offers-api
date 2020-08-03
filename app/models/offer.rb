class Offer < ApplicationRecord
  belongs_to :client, class_name: User.to_s
end
