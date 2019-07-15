class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to user_article_path(@user,@article)
  end
  def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to user_articles_path(@article)
  end
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.all
  end

  private
  def comment_params
    params.require(:article).permit(:commenter, :body)
  end
end
