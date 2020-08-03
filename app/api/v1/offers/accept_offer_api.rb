module V1
  module Offers
    class AcceptOfferApi < Grape::API
      desc 'Accept Offer',
        success: { code: 201, model: Entities::Offer }
      put do
        { success: true }
      end
    end
  end
end
