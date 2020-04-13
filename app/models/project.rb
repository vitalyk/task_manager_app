class Project < ApplicationRecord
  before_save { name.downcase! }
  validates :name, presence: true, length: { minimum: 6, maximum: 50}, 
		   uniqueness: { case_sensitive: false }			
end
