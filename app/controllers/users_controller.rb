class UsersController < ApplicationController
  def new
      @user = User.new
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
          sign_in @user
          flash[:success] = "Welcome to EduScore #{@user.name}!"
          redirect_to root_path
      else
          render 'new'
      end
  end
  
  def show
      @user = User.find(params[:id])
  end

end
