class Review < ActiveRecord::Base
 	belongs_to :user
	belongs_to :movie
	validates :title, presence: true
	validates :content, presence: true
	validates :rating, presence: true, numericality: { :less_than_or_equal_to=>5, :greater_than_or_equal_to=>0 }
end
