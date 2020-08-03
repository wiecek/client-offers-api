module V1
  module Entities
    class Offer < Grape::Entity
      expose :quantity, documentation: { type: String, required: true }
      expose :salesman, using: Entities::User, documentation: { required: true }
      expose :client, using: Entities::User, documentation: { required: true }
    end
  end
end
