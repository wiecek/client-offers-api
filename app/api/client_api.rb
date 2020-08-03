class ClientApi < Grape::API
  format :json
  prefix :v1

  rescue_from DomainError do |e|
    error!(e.message, 409)
  end

  mount V1::OffersApi

  add_swagger_documentation
end
