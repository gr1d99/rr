class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @articles }
    end
  end

  def new
    p request.variant
  end

  def create
    @article = Article.new(article_params)

    if @article.valid?
      @article.save!

      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      p @article.errors
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to articles_path
  end

  def preview
    render plain: 'aaaa'
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
