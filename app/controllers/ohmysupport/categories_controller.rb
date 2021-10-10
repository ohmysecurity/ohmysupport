require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class CategoriesController < ApplicationController
    before_action :find_category, only: [:show]

    def show
      @articles = if current_staff
                    @category.articles
                  else
                    @category.articles.enabled
                  end
    end

    private

    def find_category
      @category = Ohmysupport::Category.find(params[:id])
    end
  end
end
