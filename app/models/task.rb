class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 80 }
  validates :detail, presence: true, length: { maximum: 250 }
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  #Define Fucntion to search answer in databse
  #name is string so function scope is
  scope :name_search, -> (params) { where('(name LIKE ?)', "#{[:task][:name]}")}
  #status is integer so function scope is
  scope :status_search, -> (params) { where(status: params[:task][:status])}
  #Define enum function
  #status is integer but we want to see the meaning of each number
  enum status: {not_yet: 0, in_progress: 1, completed: 2}
  #prority is integer but we want to see the meaning of each number
  enum priority: {high: 0, middle: 1, low: 2}
end
