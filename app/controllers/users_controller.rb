class UsersController < ApplicationController
  def create
    @user = User.new(params[:user].permit(:username, :password))
    @user.password = params[:password]
    @user.save!
  end
end
