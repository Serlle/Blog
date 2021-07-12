class CommentsController < ApplicationController
  http_basic_authenticate_with name: "Serlle", password: "123", only: :destroy

  def create
    find_article
    @comment = Comment.new(comment_params.merge(article_id: @article.id))


    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end

  def destroy
    find_article
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
