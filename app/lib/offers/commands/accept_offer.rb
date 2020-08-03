module Offers
  module Commands
    class AcceptOffer < Command
      attribute :offer_id, Types::UUID

      class Handler
        def call(command)
          offer = Offer.find(command.offer_id)
          offer.update!(status: 'accepted')
        end
      end
    end
  end
end
