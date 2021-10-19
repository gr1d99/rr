class CommentsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])

    render  template: 'articles/show'
  end

  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.build(comment_params)

    if @comment.valid?
      @comment.save!

      redirect_to @article
    else
      render 'articles/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to @comment.article
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
