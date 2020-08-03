module V1
  module Clients
    class FetchClientsApi < Grape::API
      desc 'Fetch available clients',
        success: { code: 200, model: Entities::User }
      get do
        present Client.all, with: Entities::User
      end
    end
  end
end
