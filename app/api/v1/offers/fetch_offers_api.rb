module V1
  module Offers
    class FetchOffersApi < Grape::API
      desc 'Fetch all offers for  the Salesman or a Client',
        success: { code: 200, model: Entities::Offer }
      get do
        error! :unauthorized, 401 unless [Client, Salesman].include?(current_user.class)

        present current_user.offers, with: Entities::Offer
      end
    end
  end
end
