class Movie < ActiveRecord::Base
  
  has_many :reviews
	has_many :actors
	has_many :genres

  validates_presence_of :title, :director, :summary
	
  #scope :has_reviewed, ->(id) {where("? == movies.id", id)}
  alias filter order
  scope :search, ->(search){ where('LOWER(title) LIKE ?', "%#{search.to_s.downcase}%") }

end
