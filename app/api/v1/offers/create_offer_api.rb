module V1
  module Offers
    class CreateOfferApi < Grape::API
      desc 'Creates an offer for the client',
        success: { code: 201, model: Entities::Offer }
      params do
        requires :client_id, type: Integer, desc: 'ID of the Client'
        requires :quantity, type: Integer, desc: 'Product quantity'
      end
      post do
        command = ::Offers::Commands::CreateOffer.new(client_id: params[:client_id], quantity: params[:quantity])

        Container.resolve(:command_bus).call(command)

        { 'success': true }
      end
    end
  end
end
