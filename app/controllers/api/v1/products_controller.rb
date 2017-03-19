class Api::V1::ProductsController < Api::V1::BaseController
  def index
    respond_with Product.all
  end

  def show
    respond_with Product.find(params[:id])
  end
end
