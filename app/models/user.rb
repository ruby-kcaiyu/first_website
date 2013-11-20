class User < ActiveRecord::Base
  validates :name,presence: true, length: {maximum: 20}
  EMAIL=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,presence: true, format: { with: EMAIL } ,
		uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6}
end
