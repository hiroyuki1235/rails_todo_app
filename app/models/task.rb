class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum:30 }
  validates :status, presence: true
end
