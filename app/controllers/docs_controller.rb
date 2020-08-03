class DocsController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  def index
    render html: File.read(Rails.root.join('public', 'api-doc.html')).html_safe
  end
end
