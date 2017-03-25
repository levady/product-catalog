class Api::V1::ProductsController < Api::V1::BaseController
  before_action :load_product, only: %i(show update destroy)

  def index
    products = Product.order(id: :desc).page(params[:page]).per(params[:per_page])
    respond_with products, meta: { total_pages: products.total_pages }
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
