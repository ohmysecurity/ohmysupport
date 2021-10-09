require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class HomeController < ApplicationController
    def index
      @categories = Ohmysupport::Category.all
    end
  end
end
