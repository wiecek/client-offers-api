module V1
  module Offers
    class AcceptOfferApi < Grape::API
      desc 'Accept Offer',
        success: { code: 201, model: Entities::Offer }
      put do
        unless current_user.is_a?(Client) && current_user.offers.exists?(id: params[:offer_id])
          error! :unauthorized, 401
        end

        command = ::Offers::Commands::AcceptOffer.new(
          offer_id: params[:offer_id]
        )
        Container.resolve(:command_bus).call(command)

        { success: true }
      end
    end
  end
end
