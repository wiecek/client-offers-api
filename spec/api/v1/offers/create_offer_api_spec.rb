require 'rails_helper'

RSpec.describe 'POST /api/v1/offers' do
  subject { post '/api/v1/offers', params: params }

  let(:client_id) { client.id }
  let(:client) { create(:client) }
  let(:params) { { client_id: client_id, quantity: 0 } }

  it 'is a successful request' do
    subject

    expect(response).to have_http_status 201
  end

  context 'when client does not exist' do
    let(:client_id) { SecureRandom.uuid }

    it 'returns an error' do
      subject

      expect(response.parsed_body).to match('error' => "Client with ID: #{client_id} not found")
    end
  end
end
