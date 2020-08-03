module V1
  class HelloApi < Grape::API
    namespace :hello do
      mount Hello::FetchHelloApi
    end
  end
end
