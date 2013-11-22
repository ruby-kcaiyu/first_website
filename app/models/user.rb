class User < ActiveRecord::Base
  validates :name,presence: true, length: {maximum: 20}
  EMAIL=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,presence: true, format: { with: EMAIL } ,
		uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6}



before_create :create_remember

  def User.new_remember
  	  SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
	  Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember
	self.remember = User.encrypt(User.new_remember)
  end
end

