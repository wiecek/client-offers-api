class Api < Grape::API
  format :json
  prefix :v1

  helpers V1::Helpers::AuthHelpers

  rescue_from DomainError do |e|
    error!(e.message, 409)
  end

  mount V1::OffersApi
  mount V1::ClientsApi

  add_swagger_documentation
end
