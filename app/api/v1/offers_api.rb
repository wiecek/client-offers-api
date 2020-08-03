module V1
  class OffersApi < Grape::API
    before do
      error! 'Unauthorized', 401 unless authenticated?
    end

    namespace :offers do
      mount Offers::CreateOfferApi
    end
  end
end
