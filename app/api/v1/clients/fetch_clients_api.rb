module V1
  module Clients
    class FetchClientsApi < Grape::API
      desc 'Fetch available clients',
        success: { code: 200, model: Entities::Client }
      get do
        present Client.all, with: Entities::Client
      end
    end
  end
end
