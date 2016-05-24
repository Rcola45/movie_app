class Movie < ActiveRecord::Base
  
  has_many :reviews
	has_and_belongs_to_many :cast
	has_and_belongs_to_many :genres

  validates_presence_of :title, :director, :summary
	
  #scope :has_reviewed, ->(id) {where("? == movies.id", id)}
  #alias filter order
  scope :search, ->(search){ where('LOWER(title) LIKE ?', "%#{search.to_s.downcase}%") }

end
