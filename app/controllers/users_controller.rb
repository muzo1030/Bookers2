class UsersController < ApplicationController
	def edit
        @user = User.find(params[:id])
    end

    def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = Book.all
	end

end
