class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 80 }
  validates :detail, presence: true, length: { maximum: 250 }

end
