class Actor < ActiveRecord::Base
  belongs_to :movie
  validates :first_name, presence: true
  validates :last_name, presence: true
end
