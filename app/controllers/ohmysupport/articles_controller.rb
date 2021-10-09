require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class ArticlesController < ApplicationController
    before_action :load_category
    before_action :load_article, only: [:show, :edit, :update, :toggle]

    def show; end

    def new
      @article = Ohmysupport::Article.new
    end

    def create
    end

    def edit; end

    def update
    end

    def toggle
      if @article.enabled?
        @article.disable!
      else
        @article.enable!
      end

      redirect_to category_article_path(@category, @article),
        notice: 'Article visibility changed'
    end

    private

    def load_category
      @category = Ohmysupport::Category.find(params[:category_id])
    end

    def load_article
      @article = @category.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit()
    end
  end
end
