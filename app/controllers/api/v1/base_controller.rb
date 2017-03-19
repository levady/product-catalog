class Api::V1::BaseController < ActionController::Base
  self.responder = ApiResponder
  respond_to :json

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json:       exception.record,
           status:     :unprocessable_entity,
           adapter:    :json_api,
           serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
