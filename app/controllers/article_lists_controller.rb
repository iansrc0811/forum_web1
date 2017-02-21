class ArticleListsController < ApplicationController
  before_action :set_article_list, only: [:show, :edit, :update, :destroy]

  # GET /article_lists
  # GET /article_lists.json
  def index
    @article_lists = ArticleList.all
  end

  # GET /article_lists/1
  # GET /article_lists/1.json
  def show
  end

  # GET /article_lists/new
  def new
    @article_list = ArticleList.new
  end

  # GET /article_lists/1/edit
  def edit
  end

  # POST /article_lists
  # POST /article_lists.json
  def create
    @list = List.find(params[:list_id])
    if params[:item_name].present? and @list
      
      article = Article.find_by_name(params[:item_name])
      if article#如果在Article db裡已經有此項目, 簡查是否在ArticleList中已經有存過同樣的article.id和list_id組合
        if ArticleList.repeat?(article, @list)
          #已經在此list中加入過此書
          #應該要不顯示「加入清單」的選項，或是顯示「已加入」
          flash[:error] = "清單中已存在此項目"
        else
          @article_list = ArticleList.new(article_id: article.id, list_id: @list.id)
        end
        
      else #沒在article db裡，要新增至article db , 再加入articlelist db
        article = Article.new_by_search(params[:item_name], params[:item_link], params[:item_image])
        if article.save
          @article_list = ArticleList.new(article_id: article.id, list_id: @list.id)
        else
          @article_list = nil
          flash[:error] = "無法加入"
        end
      end
    else
      #@article_list = nill
      flash[:error] = "無法加入此項目 檢查@list"
    end

    if @article_list and @article_list.save
      redirect_to list_path(@list.id), notice: 'Article list was successfully created.' 

    else
      redirect_to list_path(@list.id), notice: 'faild to add to list'

    end

  end

  # PATCH/PUT /article_lists/1
  # PATCH/PUT /article_lists/1.json
  def update
    respond_to do |format|
      if @article_list.update(article_list_params)
        format.html { redirect_to @article_list, notice: 'Article list was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_list }
      else
        format.html { render :edit }
        format.json { render json: @article_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_lists/1
  # DELETE /article_lists/1.json
  def destroy
    @article_list.destroy
    list = List.find(params[:list_id])
    redirect_to list_path(list.id), notice: 'Article list was successfully destroyed.'
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_list
      @article_list = ArticleList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_list_params
      params.require(:article_list).permit(:user_id, :stock_id)
    end
end
