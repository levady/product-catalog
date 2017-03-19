class Api::V1::ProductsController < Api::V1::BaseController
  def index
    respond_with Product.all
  end

  def show
    respond_with Product.find(params[:id])
  end

  def create
    respond_with Product.create!(product_params)
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
