module Offers
  module Commands
    class CreateOffer < Command
      attribute :client_id, Types::UUID
      attribute :quantity, Types::Strict::Integer

      class Handler
        def call(command)
          client = Client.find_by(id: command.client_id)
          raise DomainError, "Client with ID: #{command.client_id} not found" unless client

          Offer.create(client_id: command.client_id, quantity: command.quantity)
        end
      end
    end
  end
end
