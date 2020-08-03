class Offer < ApplicationRecord
  belongs_to :client
  belongs_to :salesman

  # TODO: Add enum for statuses
end
