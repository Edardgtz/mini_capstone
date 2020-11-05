# i = 0
# while i < 10  
#   product = Product.new(name: Faker::Commerce.product_name, price: Faker::Commerce.price, image_url: Faker::Internet.url )
#   i += 1
#   product.save
# end

product = Product.find_by(id: 11)
product.description = "Color: Oak, Material: Oak Wood, Size: 48 inches wide by 60 inches deep and 36 inches high."
product.save
p product