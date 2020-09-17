class Task < 
  validates :name, presence: true, length: { maximum: 80 }
  validates :detail, presence: true, length: { maximum: 220 }

end
