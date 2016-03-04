class Product
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :image_url, type: String
  field :price, type: Money
end
