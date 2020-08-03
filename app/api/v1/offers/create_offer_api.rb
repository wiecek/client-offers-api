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
        client = Client.find_by(id: params[:client_id])
        raise DomainError, "Client with ID: #{params[:client_id]} not found" unless client

        Offer.create(client_id: params[:client_id], quantity: params[:quantity])

        { 'success': true }
      end
    end
  end
end
