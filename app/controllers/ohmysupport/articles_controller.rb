require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class ArticlesController < ApplicationController
    before_action :load_category
    before_action :load_article, only: [:show, :edit, :update, :toggle]
    before_action :staff_signed_in?, only: [:new, :create, :edit, :update, :toggle]

    def show; end

    def new
      @article = Ohmysupport::Article.new
    end

    def create
      @article = Ohmysupport::Article
        .create(
          article_params.merge(
            author_id: current_staff.id,
            category_id: @category.id
          )
        )

      if @article.persisted?
        redirect_to category_article_path(@category, @article), notice: 'Successfully created'
      else
        render :new, notice: 'Fill all fields, please'
      end
    end

    def edit; end

    def update
      result = @article.update(article_params)

      if @article.valid?
        redirect_to category_article_path(@category, @article), notice: 'Successfully updated'
      else
        render :new, notice: 'Fill all fields, please'
      end
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
      params.require(:article).permit(:title, :description)
    end
  end
end
