class Movie < ActiveRecord::Base
	has_many :reviews
	has_many :actors
	has_many :genres
	validates :title, presence: true
	validates :director, presence: true
	validates :summary, presence: true

  #scope :has_reviewed, ->(id) {where("? == movies.id", id)}
end
