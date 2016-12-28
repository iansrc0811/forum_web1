class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :show, :destroy]

  def index
    @lists = List.paginate(page: params[:page], per_page: 10)
  end

  def new
     @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      flash[:success] = "List was successfully created"
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:success] = "List was successfully updated"
      redirect_to list_path(@list)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @list.destroy
    flash[:danger] = 'List was successfully deleted'
    redirect_to lists_path
  end

  private
    def set_list
      @list = List.find(params[:id])
    end
    
    def list_params
      params.require(:list).permit(:name,:description, article_ids: [])
    end

end
