require 'rails_helper'

RSpec.describe 'User Authentication' do
  subject { post '/api/v1/offers', params: params, headers: headers }

  let(:params) { { client_id: create(:client).id, quantity: 0 } }

  it 'return 401 Unauthorized', :aggregate_failures do
    subject

    expect(response).to have_http_status 401
    expect(response.parsed_body).to match('error' => 'Unauthorized')
  end

  context 'when proper auth headers are provided' do
    let(:user) { create(:salesman) }
    let(:headers) { { 'X-Access-Token' => user.authentication_token } }

    it 'is successful' do
      subject

      expect(response).to have_http_status 201
    end
  end
end
