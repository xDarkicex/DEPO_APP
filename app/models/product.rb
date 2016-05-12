class Product < ActiveRecord::Base

	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.00}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
			with: %r{\.(gif|jpg|jpeg|png)\z}i,
			message: "Must be a file name ending in gif, jpg, or png."
	}

	def self.latest
		Product.order(:updated_at).last
	end

	def ensure_not_referenced_by_any_line_item

	end

	private
	def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'This product exists in some users cart')
				return false
			end
	end


end
