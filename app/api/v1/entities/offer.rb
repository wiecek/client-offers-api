module V1
  module Entities
    class Offer < Grape::Entity
      expose :quantity, documentation: { type: String, required: true }
      expose :client, using: Entities::Client, documentation: { required: true }
    end
  end
end
