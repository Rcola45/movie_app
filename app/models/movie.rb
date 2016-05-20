class Movie < ActiveRecord::Base
	require 'net/http'
  require 'uri'
  has_many :reviews
	has_many :actors
	has_many :genres
	validates :title, presence: true
	validates :director, presence: true
	validates :summary, presence: true
  #scope :has_reviewed, ->(id) {where("? == movies.id", id)}
  scope :filter, ->(option){order(option)}
  scope :search, ->(search){ where('title LIKE ?', "%#{search}%") }

  def has_left_review?(id)
    reviews.exists?(:user_id=>id)
  end



end
