5.times do |index|
  Product.create(name: "Product #{index + 1}", price: rand(100), description: 'product description')
end
