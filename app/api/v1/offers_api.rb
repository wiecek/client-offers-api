module V1
  class OffersApi < Grape::API
    namespace :offers do
      mount Offers::CreateOfferApi
    end
  end
end
