class UsersController < ApplicationController
	 def new
  	@user = User.new
  	end
  	def create
  		@user=User.new(users_params)
  		if @user.save
  			redirect_to_root_path
  		end

  	end
  	def login
  		@user=User.new
  	end
  	def result
  		
  	 @user=User.find_by(email:params[:user][:email], password: params[:user][:password])

  		redirect_to user_path(@user.id)
  	end
  	def show
  		@user = User.find(params[:id])
  	end
  	
  	def edit 
  		@user = User.find(params[:id])
  	end
  	def update
  		@user = User.find(params[:id])
  		@user.update(users_params)
  		if @user.save
  			redirect_to user_path(@user.id)
  		end

  	end
  	def destroy
  		User.find(params[:id]).destroy
  		flash[:success] = "User deleted"
  		
  		
  		
  		redirect_to root_path
  	end
  	private
  def users_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
