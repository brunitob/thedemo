class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def profile
    @user = User.find(current_user)
  end
  def follow
  	@user_to_follow = User.find(params[:id])
	@user = User.find(current_user)
	
	 if @user.follow(@user_to_follow) # Creates a record for the user as the follower and the book as the followable
      flash[:success] = "NEW FOLLOW!"
      #redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      flash[:alert] = "No follow"
      #redirect_to :controller => 'users', :action => 'show', :id => @user.id
    end
  end
end