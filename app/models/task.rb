class Task < ApplicationRecord
  belongs_to :user
  #Add creat at date order
  validates :name, presence: true, length: { maximum: 80 }
  validates :detail, presence: true, length: { maximum: 250 }
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  #Define Fucntion to search answer in databse
  #name is string so function scope is
  scope :name_search, -> (text_search) {where("(name LIKE ?)", "%#{text_search}%")}
  #status is integer so function scope is
  scope :status_search, -> (text_search) { where(status: text_search)}
  #Define enum function
  #status is integer but we want to see the meaning of each number
  enum status: { not_yet: 0, in_progress: 1, completed: 2 }
  #prority is integer but we want to see the meaning of each number
  enum priority: { high: 0, middle: 1, low: 2 }
  #Add paginate function 
  paginates_per 4
  #Labelling
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
