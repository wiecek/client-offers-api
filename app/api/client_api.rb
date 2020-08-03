class ClientApi < Grape::API
  format :json
  prefix :v1

  mount V1::OffersApi

  add_swagger_documentation
end
