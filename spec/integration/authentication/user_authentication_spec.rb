require 'rails_helper'

RSpec.describe 'User Authentication' do
  subject { get '/api/v1/offers', headers: headers }

  it 'return 401 Unauthorized', :aggregate_failures do
    subject

    expect(response).to have_http_status 401
    expect(response.parsed_body).to match('error' => 'Unauthorized')
  end

  context 'when proper auth headers are provided' do
    let(:user) { create(:admin) }
    let(:headers) { { 'X-Access-Token' => user.authentication_token } }

    it 'is successful' do
      subject

      expect(response).to have_http_status 200
    end
  end
end
