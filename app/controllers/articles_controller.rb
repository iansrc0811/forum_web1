class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def new

     @article = Article.new
     authorize @article
  end

  def create
    authorize @article
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Create a new book in list"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title,:description)
    end

end
