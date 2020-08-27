class UsersController < ApplicationController
 before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.order_by_first_name
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # redirect_to user_path(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
params.require(:user).permit(:first_name, :last_name)
  end
end
