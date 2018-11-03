class ApplicationController < ActionController::API
  # app/controllers/application_controller.rb
  include Knock::Authenticable
end
