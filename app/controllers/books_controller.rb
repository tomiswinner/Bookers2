class BooksController < ApplicationController
  def new
    @book = Book.new()
  end

  def create
    @book = Book.new(books_params)
    @book.save
    redirect_to(book_path(@book.id))
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def books_params
    params.require(:book).permit(:title,:body)
  end

end
