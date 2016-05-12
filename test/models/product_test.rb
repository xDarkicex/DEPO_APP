require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "product fields must not be blank" do
	  	product = Product.new
	  	assert product.invalid?
	  	assert product.errors[:title].any?
	  	assert product.errors[:description].any?
	  	assert product.errors[:price].any?
	  	assert product.errors[:image_url].any?
	end

	test "product price must be positive" do
		product = Product.new( title: "Monopoly",
								description: "Your mon loves this game.",
								image_url: "monopoly.jpg")
		product.price = -1.00
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.0"], product.errors[:price]

		product.price = 0.0
		assert product.valid?

		product.price = 1.00
		assert product.valid?
	end

	def new_product (img)
		Product.new(title: "Foo",
					description: "I don't care.",
					price: 1.00,
					image_url: img)
	end

	test "image url needs to be valid file type" do

		ok = %w{foo.gif foo.jpg foo.png FOO.JPG Foo.Jpg http://www.foo.jpg}
		bad = %w{foo.bmp foo.jpg/more foo.jpg.more foo.tiff foo.tif}

		ok.each do |name|

			assert new_product(name).valid?,
			"#{name} should be valid"

		end

		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end
	end

	test "product cannot have already taken title" do 

		product = Product.new(title: products(:sorry).title,
								description: "I don't care.",
								image_url: "foo.jpg",
								price: 1.00)
		assert product.invalid?
		assert_equal ["has already been taken"], product.errors[:title]
	end

end

