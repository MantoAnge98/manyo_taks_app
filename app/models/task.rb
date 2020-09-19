class Task < ApplicationRecord
  #Add creat at date order
  default_scope { order(created_at: :desc)}
  validates :name, presence: true, length: { maximum: 80 }
  validates :detail, presence: true, length: { maximum: 250 }

end
