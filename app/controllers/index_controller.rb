class IndexController < ApplicationController
  def register
  	@title="Register"
	if request.post? and params[:user]
		@user=User.new(user_params)
		if @user.save
			redirect_to :action=>"index"
		else
			render 'Register'
		end
	end
		
  end

  def creat
  	@title="Login"
	if request.post? and params[:user]
		@user=User.new(log_params)
		user=User.find_by_name_and_password(@user.name,@user.password)
		if user
			redirect_to :action=>"index"
		else
			render 'register'
		end
	end

  end
end
  
  def index
  	@title="Home"
  end
  private

  def user_params
  	params.require(:user).permit(:name,:email,:password)
  end
  def log_params
  	params.require(:user).permit(:name,:password)
  end
