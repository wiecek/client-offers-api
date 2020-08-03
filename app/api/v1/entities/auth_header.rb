module V1
  module Entities
    class AuthHeader < Grape::Entity
      expose 'X-Access-Token', documentation: {
        description: 'Access token received during Sign up', type: String, required: true
      }
    end
  end
end
