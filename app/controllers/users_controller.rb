class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

	def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
	end

	def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
	end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

end
