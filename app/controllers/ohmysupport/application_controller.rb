module Ohmysupport
  class ApplicationController < ActionController::Base
    private

    def any_signed_in?
      (current_staff || current_user) ? true : handle_unauthorized
    end

    def user_signed_in?
      current_user ? true : handle_unauthorized 
    end

    def staff_signed_in?
      current_staff ? true : handle_unauthorized
    end

    def handle_unauthorized
      redirect_to root_path
    end
  end
end
