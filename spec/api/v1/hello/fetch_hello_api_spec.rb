require 'rails_helper'

RSpec.describe 'GET /api/v1/hello' do
  subject { get '/api/v1/hello' }

  it 'is a successful request' do
    subject

    expect(response).to have_http_status(200)
  end

  it 'returns proper response' do
    subject

    expect(response.parsed_body).to match('success' => true)
  end
end
