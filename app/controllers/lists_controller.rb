class ListsController < ApplicationController
  include Crawler
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_list, only: [:edit, :update, :show, :destroy]

  def index
    @lists = List.paginate(page: params[:page], per_page: 10)
  end

  def new
    
    @list = List.new
    authorize @list
  end

  def create
    
    @list = List.new(list_params)
    authorize @list
    @list.user = current_user
    if @list.save
      flash[:success] = "List was successfully created"
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def edit
    authorize @list
  end

  def update
    authorize @list
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

  def search_book
    input = params[:query]
    @list = List.find(params[:list_id])
    @book_items = Crawler.start_crawler(input) 
    
    if @book_items
      render :partial => "search/show_result"
    else
      render status: :not_found, nothing: true 
    end
  end

  def add_to_shop_car
    @list = List.find(params[:list_id])
    redirect_to list_path(@list)
  end

  private

    def set_list
      @list = List.find(params[:id])
    end
    
    def list_params
      params.require(:list).permit(:name,:description, article_ids: [])
    end
end
