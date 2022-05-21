class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
 end

 def index
  @user = current_user
  @book = Book.new
  @users =User.all
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  @user.update(user_params)
   if @user.save
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user)
   else
    flash[:alart] = "fault"
    @users = User.all
    render "edit"
   end
 end

 def create
  @user = User.new(user_params)
  if @usre.save
   redirect_to usre_path(@user.id)
  else
   render :new
  end
 end

 private

 def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
 end

end
