class SearchController < ApplicationController
  def search
    methods = ["完全一致", "前方一致", "後方一致", "部分一致"]
    if params[:model] == "user"
      @condition = 'ユーザー名'
      @content = params[:content]
      @search_method = methods[params[:method].to_i-1]
      @users = User.search(params[:method].to_i, :name, params[:content])
      render 'users/user_search_result', locals: {condition: @condition, content: @content, users: @users, search_method: @search_method}
    else
      @condition = '本タイトル'
      @content = params[:content]
      @search_method = methods[params[:method].to_i-1]
      @books = Book.search(params[:method].to_i, :title, params[:content])
      render 'books/book_search_result', locals: {condition: @condition, content: @content, books: @books, search_method: @search_method}
    end

  end

end
