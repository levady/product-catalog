class Api::V1::ProductsController < Api::V1::BaseController
  before_action :load_product, only: %i(show update destroy)

  def index
    respond_with Product.order(id: :desc)
  end

  def show
    respond_with @product
  end

  def create
    respond_with Product.create!(product_params)
  end

  def update
    @product.update!(product_params)
    respond_with @product
  end

  def destroy
    @product.destroy!
    respond_with @product
  end

private

  def product_params
    params.require(:data).require(:attributes).permit(:name, :description, :price)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
