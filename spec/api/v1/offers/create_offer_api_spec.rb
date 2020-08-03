require 'rails_helper'

RSpec.describe 'POST /api/v1/offers' do
  subject { post '/api/v1/offers', params: params }

  let(:client) { create(:client) }
  let(:params) { { client_id: client.id } }

  it 'is a successful request' do
    subject

    expect(response).to have_http_status 201
  end
end
