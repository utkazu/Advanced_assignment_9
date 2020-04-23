class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
	end

	def show
    @book = Book.find(params[:id])
		@user = User.find(@book.user_id)
		@book_new = Book.new
		@comments = BookComment.where(book_id: @book.id).order(:id)
		@comment = BookComment.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book.id)
		else
			@user = User.find(current_user.id)
			@books = Book.where(user_id: @user.id)
			render 'users/show'
		end
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book.id)
		else
			render 'books/edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end


	private

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end
