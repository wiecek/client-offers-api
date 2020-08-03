require 'rails_helper'

RSpec.describe 'GET /api/v1/clients' do
  subject do
    get '/api/v1/clients'
    response.parsed_body
  end

  let!(:clients) { create_list(:client, 2) }

  it 'returns all clients' do
    expect(subject).to match_array [
      match_client(clients.first),
      match_client(clients.second)
    ]
  end

  def match_client(client)
    match(
      'id' => client.id,
      'name' => client.name
    )
  end
end