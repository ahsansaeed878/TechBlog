class ArticlesController < ApplicationController

  def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @article.destroy

    redirect_to user_articles_path
  end

  def edit
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to user_article_path(@user, @article)
    else
      render 'edit'
    end
  end

  def new
    @article = Article.new
  end
  def show
    @article = Article.find(params[:id])
  end
  def index
    @articles = Article.all
  end
  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)
    redirect_to user_article_path(@user, @article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
