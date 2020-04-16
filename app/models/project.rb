class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_save { name.downcase! }
  validates :name, presence: true, length: { minimum: 6, maximum: 50}, 
		   uniqueness: { case_sensitive: false }			
end
