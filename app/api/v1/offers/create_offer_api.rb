module V1
  module Offers
    class CreateOfferApi < Grape::API
      desc 'Creates an offer for the client',
        success: { code: 201 }
      post do
        { 'success': true }
      end
    end
  end
end
