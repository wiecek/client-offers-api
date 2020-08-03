require 'rails_helper'

RSpec.describe 'GET /api/v1/offers' do
  subject do
    get '/api/v1/offers', headers: headers
    response.parsed_body
  end

  let(:client) { create(:client) }
  let(:other_client) { create(:client) }

  let!(:client_offers) { create_list(:offer, 3, client: client) }
  let!(:other_client_offers) { create_list(:offer, 2, client: other_client) }

  describe 'for Admin' do
    let(:headers) { { 'X-Access-Token' => admin.authentication_token } }

    let(:admin) { create(:admin) }

    it 'returns all offers' do
      expect(subject).to match_array [
        match_offer(client_offers.first),
        match_offer(client_offers.second),
        match_offer(client_offers.third),
        match_offer(other_client_offers.first),
        match_offer(other_client_offers.second)
      ]
    end
  end

  describe 'for Client' do
    let(:headers) { { 'X-Access-Token' => client.authentication_token } }

    it 'returns Offers created for the Client' do
      expect(subject).to match_array [
        match_offer(client_offers.first),
        match_offer(client_offers.second),
        match_offer(client_offers.third)
      ]
    end
  end

  def match_offer(offer)
    match(
      'client' => a_hash_including('id' => offer.client.id),
      'salesman' => a_hash_including('id' => offer.salesman.id),
      'quantity' => offer.quantity,
      'width' => offer.width,
      'height' => offer.height,
      'length' => offer.length
    )
  end
end
