class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all

    @currentUserEntry = UserRoom.where(user_id: current_user.id)
    @userEntry = UserRoom.where(user_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)

    @currentUserEntry = UserRoom.where(user_id: current_user.id)
    @userEntry = UserRoom.where(user_id: @user.id)
    #ここはもっといいやり方ありそう
    if @user.id != current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if !@isRoom
        @room = Room.new
        @entry = UserRoom.new
      end
    end
  end

  def edit
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user.id)
    else
      @user = User.find(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render "users/edit"
    end
  end

  def following
    user = User.find(params[:id])
    @users = user.following
    @headline = "Following Users"
    render 'show_follow'
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
    @headline = "Followers"
    render 'show_follow'
  end



  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
