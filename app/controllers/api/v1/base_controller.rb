class Api::V1::BaseController < ActionController::Base
  self.responder = ApiResponder
  respond_to :json
end
