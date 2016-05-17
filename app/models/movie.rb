class Movie < ActiveRecord::Base
	has_many :reviews
	has_many :actors
	has_many :genres
	validates :title, presence: true
	validates :director, presence: true
	validates :summary, presence: true
end
