# i = 0
# while i < 10  
#   product = Product.new(name: Faker::Commerce.product_name, price: Faker::Commerce.price, image_url: Faker::Internet.url )
#   i += 1
#   product.save
# end

# product = Product.find_by(id: 5)
# product.description = "Color: Beige, Material: Linen, Size: 12 inches x 12 inches, Disclamer: Not a real computer."
# product.save
# p product

# products = Product.all

# products.each do |product|
#   url = rand(1..25)
#   product.update(url: url)
# end



# 12.times do 
#   Image.create!(url: Faker::Avatar.image, product_id: rand(1..12))
# end
 
