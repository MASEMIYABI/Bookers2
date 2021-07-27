class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    flash[:book]="You have created book successfully."
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
   
  end

  def index
    @book = Book.new
    @books =Book.all
    @user = current_user
  end

  def show
  @user = current_user
  @book = Book.find(params[:id])
  @books = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])
    flash[:books]="You have updated book successfully."
    @book.update(book_params)
    redirect_to book_path

  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end