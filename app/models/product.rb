class Product < ActiveRecord::Base
  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  before_validation :strip_whitespace

private

  def strip_whitespace
    self.name&.strip!
    self.description&.strip!
  end
end
