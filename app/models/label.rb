class Label < ApplicationRecord
  validates :name, presence:true
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings

  belongs_to :user
  paginates_per 4
end
