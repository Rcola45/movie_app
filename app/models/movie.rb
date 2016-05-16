class Movie < ActiveRecord::Base
	has_many :reviews
	has_many :actors
	has_many :genres
end
