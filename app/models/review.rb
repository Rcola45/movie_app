class Review < ActiveRecord::Base
 	belongs_to :user
	belongs_to :movie
	validates :title, presence: true, length: { in: 4..40 }
	validates :content, presence: true
	validates :rating, presence: true, numericality: { :less_than_or_equal_to=>5, :greater_than_or_equal_to=>0 }

  def is_users_review?(id)
    user_id==id
  end

  def get_username(id)
    User.find(id).email[/[^@]+/]
  end
end
