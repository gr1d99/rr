# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @articles }
    end
  end

  def new
    Rails.logger.debug request.variant
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
      Rails.logger.debug @article.errors
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
    permitted = params.require(:article).permit(:title, :description, :publish)

    if permitted[:publish]
      permitted[:published_at] = DateTime.now

      permitted.delete(:publish)

    end
    permitted
  end
end
