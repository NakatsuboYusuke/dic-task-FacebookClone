class UsersController < ApplicationController

  before_action :user_params, only: [:create]
  before_action :set_users, only: [:show]

  # skip_before_action
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウントを作成しました"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :birthday, :gender)
    end

    def set_users
      @user = User.find(params[:id])
    end

end
