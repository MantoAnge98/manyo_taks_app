class User < ApplicationRecord
  before_destroy :destroy_admin
  before_update :update_admin

  has_many :tasks, dependent: :destroy
  has_secure_password
  #Transform Uppercase to lowercase before save
  before_validation {email.downcase}
  #Add validates function before go to databse
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, on: :create,
                                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, presence: true, length: {minimum: 6},  on: [:create]


  #Define private method 
  private
  def destroy_admin
    if User.where(admin: true).count == 1 && self.admin == true
      user = User.where(admin: true)
      throw :abort if user[0] == self
    end
  end

  def update_admin
    if User.where(admin: true).count == 1 && self.admin == [true, false]
      user = User.where(admin: true)
      if user[0] == self
        errors.add(:user, 'you are currently the only administrator. Please choose another administrator before ')
        throw(:abort)
      end
    end
  end
  
  paginates_per 5
end
