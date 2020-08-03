require 'rails_helper'

RSpec.describe 'PUT /api/v1/offers/:offer_id' do
  subject { put "/api/v1/offers/#{offer.id}", headers: { 'X-Access-Token' => client.authentication_token } }

  let(:offer) { create(:offer, client: client) }
  let(:client) { create(:client) }

  it 'is a successful request' do
    subject

    expect(response).to have_http_status 200
  end

  pending 'accepts the offer' do
    expect { subject }
      .to change { offer.reload.status }
      .from('created')
      .to('accepted')
  end
end
