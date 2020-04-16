class Task < ApplicationRecord
  belongs_to :project
  validates :project_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end
