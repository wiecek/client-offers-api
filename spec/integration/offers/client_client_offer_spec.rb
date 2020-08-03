require 'rails_helper'

RSpec.describe 'Client Offer lifecycle' do
  subject do
    create_offer
    expect(response).to have_http_status 201

    fetch_offers(nil)
    expect(response).to have_http_status 200

    response.parsed_body
  end

  let(:params) { { client_id: client.id } }
  let(:client) { create(:client) }

  xit 'return a new offer for the client' do
    expect(subject).not_to be_nil
  end

  def create_offer
    post '/api/v1/offers', params: params
  end

  def fetch_offers(auth_header)
    get '/api/v1/me/offers', headers: auth_header
  end
end
