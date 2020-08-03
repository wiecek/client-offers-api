module Offers
  module Commands
    class CreateOffer < Command
      attribute :offer_id, Types::UUID
      attribute :salesman_id, Types::UUID
      attribute :client_id, Types::UUID
      attribute :quantity, Types::Strict::Integer

      class Handler
        def call(command)
          client = Client.find_by(id: command.client_id)
          raise DomainError, "Client with ID: #{command.client_id} not found" unless client

          Offer.create(
            id: command.offer_id,
            salesman_id: command.salesman_id,
            client: client,
            quantity: command.quantity
          )
        end
      end
    end
  end
end
