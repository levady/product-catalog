class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :display_price

  def display_price
    "$#{object.price}"
  end
end
