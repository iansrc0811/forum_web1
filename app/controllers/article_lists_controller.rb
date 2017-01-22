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
    if params[:item_name].present?
      article = Article.find_by_name(params[:item_name])
      if (article)#如果在db裡已經有此項目
        @article_list = ArticleList.new(article_id: article.id, list_id: @list.id)
      else #沒在db裡，要新增至db 
        article = Article.new_by_search(params[:item_name], params[:item_link], params[:item_image])
        @article_list = ArticleList.new(article_id: article.id, list_id: @list.id)
      end
    else
      @article_list = nill
      flash[:error] = "無法加入此項目"
    end

    respond_to do |format|
      if @article_list.save
        format.html { redirect_to search_book_path, notice: 'Article list was successfully created.' }
        format.json { render :show, status: :created, location: @article_list }
      else
        format.html { render :new }
        format.json { render json: @article_list.errors, status: :unprocessable_entity }
      end
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
    respond_to do |format|
      format.html { redirect_to article_lists_url, notice: 'Article list was successfully destroyed.' }
      format.json { head :no_content }
    end
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
