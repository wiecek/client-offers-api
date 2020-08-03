require 'rails_helper'

RSpec.describe 'PUT /api/v1/offers/:offer_id' do
  subject { put "/api/v1/offers/#{offer.id}", headers: { 'X-Access-Token' => client.authentication_token } }

  let(:offer) { create(:offer, client: client) }
  let(:client) { create(:client) }

  it 'is a successful request' do
    subject

    expect(response).to have_http_status 200
  end

  it 'accepts the offer' do
    expect { subject }
      .to change { offer.reload.status }
      .from('created')
      .to('accepted')
  end

  context 'when client is not the owner of the offer' do
    before { offer.update(client: other_client) }

    let(:other_client) { create(:client) }

    it 'returns unauthorized' do
      subject

      expect(response).to have_http_status 401
    end
  end
end
