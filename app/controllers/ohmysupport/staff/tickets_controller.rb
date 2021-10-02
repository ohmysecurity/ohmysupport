require_dependency "ohmysupport/application_controller"

module Ohmysupport
  module Staff
    class TicketsController < ApplicationController
      before_action :staff_signed_in?

      def index
        @tickets = Ohmysupport::Ticket.all
      end
    end
  end
end
