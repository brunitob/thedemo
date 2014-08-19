class UsersController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :endorse]

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
      redirect_to :controller => 'users', :action => 'profile'
    else
      flash[:alert] = "No follow"
      redirect_to :controller => 'users', :action => 'profile'
    end
  end
  def endorse
    @user = User.find(params[:id])
  end
end