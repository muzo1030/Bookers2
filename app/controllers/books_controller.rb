class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def about
  end

  def show
        @book = Book.find(params[:id])
        @book2 = Book.new
        @user = current_user
  end

  def new
        @book = Book.new
        @books = Book.all
  end

  def edit
        @book = Book.find(params[:id])
  end

  def create
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @user = current_user
        if @book.save
          flash[:notice] = 'Book was successfully created.'
          redirect_to book_path(@book.id)
        else
          render :index
        end
  end

  def index
      @book = Book.new
      @books = Book.all
      @user = current_user
  end

  def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        if @book.save
          flash[:notice] = 'Book was successfully updated.'
          redirect_to book_path(@book.id)
        else
          render :edit
        end
  end

  def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:destroyed] = 'Book was successfully destroyed.'
        redirect_to user_path(current_user.id)
    end

  private
      def book_params
        params.require(:book).permit(:title, :body)
      end
end
