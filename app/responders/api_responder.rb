class ApiResponder < ActionController::Responder
  def initialize(*)
    super
    @options[:location] = nil
  end
end
