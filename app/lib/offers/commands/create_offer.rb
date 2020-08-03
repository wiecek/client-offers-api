module Offers
  module Commands
    class CreateOffer < Command
      attribute :offer_id, Types::UUID
      attribute :client_id, Types::UUID
      attribute :quantity, Types::Strict::Integer

      class Handler
        def call(command)
          client_id = command.client_id
          client = Client.find_by(id: client_id)
          raise DomainError, "Client with ID: #{client_id} not found" unless client

          Offer.create(id: command.offer_id, client_id: client_id, quantity: command.quantity)
        end
      end
    end
  end
end
