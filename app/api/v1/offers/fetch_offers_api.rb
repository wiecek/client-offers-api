module V1
  module Offers
    class FetchOffersApi < Grape::API
      desc 'Fetch all offers for  the Salesman or a Client',
        headers: Entities::AuthHeader.documentation,
        success: { code: 200, model: Entities::Offer }
      get do
        case current_user
        when Admin
          present Offer.all, with: Entities::Offer
        when Client
          present current_user.offers, with: Entities::Offer
        else
          error! :unauthorized, 401
        end
      end
    end
  end
end
