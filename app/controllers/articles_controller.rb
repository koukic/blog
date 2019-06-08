class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.order(crated_at: :desc)
  end

  def show
    
  end

  def new
    @article = Article.new
  end

  def edit
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article, notice: '更新できました'
    else
      render :new, alert: '更新できませんでした'
    end
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end
  
  def destroy
    if @article.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除に失敗しました'
    end
  end
  
  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
  
  Refile.secret_key = '3b82f19c99b41bd3944bc63ba720acb04de444654ca3813576100f8633b8171553beaf2aad96b35462c838a9b38fcad0573f903d26be367163e9c1f8b479f536'
    
end
