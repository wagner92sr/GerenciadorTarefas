class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :category

  scope :done, ->{ where(done: true) }
  scope :pending, ->{ where(done: false) }
  
end
