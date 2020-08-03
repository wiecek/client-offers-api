module V1
  module Hello
    class FetchHelloApi < Grape::API
      desc 'Return a temporary endpoint',
        success: { code: 200 }
      get do
        { 'success': true }
      end
    end
  end
end
