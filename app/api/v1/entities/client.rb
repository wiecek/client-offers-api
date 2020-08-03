module V1
  module Entities
    class Client < Grape::Entity
      expose :id, documentation: { type: String, required: true }
      expose :name, documentation: { type: String, required: true }
    end
  end
end
