module V1
  module Entities
    class User < Grape::Entity
      expose :id, documentation: { type: String, required: true }
      expose :email, documentation: { type: String, required: true }
    end
  end
end
