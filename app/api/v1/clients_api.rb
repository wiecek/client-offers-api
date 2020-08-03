module V1
  class ClientsApi < Grape::API
    namespace :clients do
      mount Clients::FetchClientsApi
    end
  end
end
