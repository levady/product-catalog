class Api::V1::BaseController < ActionController::Base
  self.responder = ApiResponder
  respond_to :json

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render text: exception.message, status: :unprocessable_entity
  end
end
