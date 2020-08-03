module V1
  module Entities
    class Offer < Grape::Entity
      expose :quantity, documentation: { type: String, required: true }
      expose :salesman, using: Entities::User, documentation: { required: true }
      expose :client, using: Entities::User, documentation: { required: true }
      expose :width, documentation: { type: Integer, required: true }
      expose :height, documentation: { type: Integer, required: true }
      expose :length, documentation: { type: Integer, required: true }
    end
  end
end
