class UsersController < ApplicationController

  def index

  end

  def new
     @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = t(:welcome)
      redirect_to @user
    else
      @title = t(:harshama)
      render 'new'
    end
  end
end
