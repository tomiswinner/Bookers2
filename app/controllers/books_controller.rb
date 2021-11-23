class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully posted"
      redirect_to(book_path(@book.id))
    else
      flash[:alert] = @book.errors.full_messages
      render(templates: "books/new")
    end

  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    redirect_to(book_path(@book.id))
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(books_path)
  end

  private
  def books_params
    params.require(:book).permit(:title,:body)
  end

end
