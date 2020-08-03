class ClientApi < Grape::API
  format :json
  prefix :v1

  mount V1::HelloApi

  add_swagger_documentation
end
