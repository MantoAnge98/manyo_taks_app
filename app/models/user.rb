class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password
  #Transform Uppercase to lowercase before save
  before_validation {email.downcase}
end
