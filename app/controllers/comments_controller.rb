class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "secret", only: [:destroy]
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    authorize! :delete, @comment
    @comment.destroy
    redirect_to article_path(@article)
  end


  private

  def comment_params
    params.require(:comment).permit(:author, :body, :user_id)
  end


end
