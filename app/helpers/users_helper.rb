module UsersHelper
  def sign_in(user)
	remember= User.new_remember
	cookies.permanent[:remember] = remember
	user.update_attribute(:remember, User.encrypt(remember))
	self.current_user = user
  end
  def current_user=(user)
	@current_user = user
  end
   def current_user
       	remember = User.encrypt(cookies[:remember])
	@current_user ||= User.find_by(remember: remember)
   end
   def signed_in?
       !current_user.nil?
   end
   def sign_out
       self.current_user = nil
       cookies.delete(:remember)
  end

end
