class BookmarksController < ApplicationController
  before_action :set_user_and_list

  def create
    @bookmark = @list.bookmarks.create(movie_id: params[:movie_id])
    redirect_to user_list_path(@user, @list)
  end

  def destroy
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to user_list_path(@user, @list)
  end

  private

  def set_user_and_list
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
  end
end
