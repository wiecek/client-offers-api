module V1
  class OffersApi < Grape::API
    before do
      error! 'Unauthorized', 401 unless authenticated?
    end

    namespace :offers do
      mount Offers::CreateOfferApi
      mount Offers::FetchOffersApi

      route_param :offer_id do
        mount Offers::AcceptOfferApi
      end
    end
  end
end
