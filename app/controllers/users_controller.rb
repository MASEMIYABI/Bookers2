class UsersController < ApplicationController
    def index
    @book = Book.new
    @users = User.all
    @user = current_user
    end

    def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        flash[:user]="You have updated user successfully"
        redirect_to user_path(@user.id)
    end

    private
    def user_params
        params.require(:user).permit(:name,:intoroduction,:profile_image)
    end
end