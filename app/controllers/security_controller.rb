class SecurityController < ApplicationController
  def login
  end
  def register
    @users = User.all
    @user = User.new
  end
end
