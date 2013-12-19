class Product < ActiveRecord::Base
	# Verifies something is written in the columns listed below before entered into the database
	validates :title, :description, :image_url, presence: true

	# Verifies the price column is a positive number
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }

	# Validates unique title
	validates :title, uniqueness: true

	# Validates an image file or blank
	validates :image_url, allow_blank: true, format: {
		# Uses regular expression
		with: %r{\.(gif|jpg|png)\Z}i,
		#  Outputs a message
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
end

