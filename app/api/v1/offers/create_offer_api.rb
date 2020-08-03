module V1
  module Offers
    class CreateOfferApi < Grape::API
      desc 'Creates an offer for the client',
        headers: Entities::AuthHeader.documentation,
        success: { code: 201, model: Entities::Offer }
      params do
        requires :client_id, type: String, desc: 'ID of the Client'
        requires :quantity, type: Integer, values: 200..1000, desc: 'Product quantity'
        requires :width, type: Integer, values: 0..200, desc: 'Product quantity'
        requires :height, type: Integer, values: 0..200, desc: 'Product quantity'
        requires :length, type: Integer, values: 0..200, desc: 'Product quantity'
      end
      post do
        error! :unauthorized, 401 unless current_user.is_a?(Salesman)

        offer_id = SecureRandom.uuid
        command = ::Offers::Commands::CreateOffer.new(
          offer_id: offer_id,
          salesman_id: current_user.id,
          client_id: params[:client_id],
          quantity: params[:quantity],
          width: params[:width],
          height: params[:height],
          length: params[:length]
        )
        Container.resolve(:command_bus).call(command)

        present Offer.find(offer_id), with: Entities::Offer
      end
    end
  end
end
