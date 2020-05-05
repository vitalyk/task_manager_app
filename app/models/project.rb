class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  before_save { name.downcase! }
  validates :name, presence: true, length: { minimum: 6, maximum: 50}, 
		   uniqueness: { case_sensitive: false }			
end
