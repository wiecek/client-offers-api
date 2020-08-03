module V1
  module Entities
    class Client < Grape::Entity
      expose :name, documentation: { type: String, required: true }
    end
  end
end
