class ListsController < ApplicationController
  def index
    @lists = List.all
    @new_list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to list_path(list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
