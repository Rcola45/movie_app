class Movie < ActiveRecord::Base
  
  has_many :reviews
	has_and_belongs_to_many :cast
	has_and_belongs_to_many :genres

  validates_presence_of :title, :director, :summary
	
  #scope :has_reviewed, ->(id) {where("? == movies.id", id)}
  #alias filter order
  scope :search, ->(search){ where('LOWER(title) LIKE ?', "%#{search.to_s.downcase}%") }


  def image
    if poster_path.present?
      return "http://image.tmdb.org/t/p/w185#{poster_path}"
    else
      return "poster_template.jpg"
    end
  end
end
