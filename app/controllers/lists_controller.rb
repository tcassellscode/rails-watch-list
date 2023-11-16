class ListsController < ApplicationController
  before_action :set_user

  def index
    @lists = @user.lists
  end

  def show
    @list = @user.lists.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = @user.lists.build
  end

  def create
    @list = @user.lists.build(list_params)
    if @list.save
      redirect_to user_list_path(@user, @list)
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
