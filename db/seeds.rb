i = 0
while i < 11  
  product = Product.new(name: Faker::Commerce.product_name, price: Faker::Commerce.price, image_url: Faker::Internet.url )
  i += 1
  p product
end