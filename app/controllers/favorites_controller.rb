class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @favorite = Favorite.new(
      user_id: current_user.id,
      book_id: params[:book_id]
    )
    @favorite.save
    # redirect_to request.referrer
  end

  def destroy
    @book = Book.find(params[:book_id])
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      book_id: params[:book_id]
    )
    @favorite.destroy
    # redirect_to request.referrer
  end
end
