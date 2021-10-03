require_dependency "ohmysupport/application_controller"

module Ohmysupport
  module Staff
    class TicketsController < ApplicationController
      before_action :staff_signed_in?

      def index
        @tickets = Ohmysupport::Ticket.order(state: :desc)
      end

      def close
        ticket = Ohmysupport::Ticket.find(params[:id])
        ticket.close!
        redirect_to staff_tickets_path, notice: 'Ticket was closed'
      end
    end
  end
end
