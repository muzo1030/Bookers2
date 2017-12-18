class BooksController < ApplicationController
  def top
  end

  def show
        @book = Book.find(params[:id])
  end

  def new
        @book = Book.new
        @books = Book.all
  end

  def edit
        @book = Book.find(params[:id])
  end

  def create
        book = Book.new(book_params)
        book.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(book.id)
  end

  def index
      @book = Book.new
      @books = Book.all
  end

  def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        flash[:updated] = 'Book was successfully updated.'
        redirect_to book_path(@book.id)
  end

  def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:destroyed] = 'Book was successfully destroyed.'
        redirect_to books_path
    end

  private
      def book_params
        params.require(:book).permit(:title, :body)
      end
end
