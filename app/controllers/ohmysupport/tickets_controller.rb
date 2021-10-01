require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class TicketsController < ApplicationController
    # TODO: allow anonymous user just to create tickets
    def index
      @tickets = Ohmysupport::Ticket.all
    end

    def new
      @ticket = Ohmysupport::Ticket.new
    end

    def create
      @ticket = Ohmysupport::Ticket.new(ticket_params)
      if @ticket.save
        redirect_to tickets_path, notice: 'Your ticket was submitted'
      else
        flash[:alert] = 'Invalid form'
        render :new
      end
    end

    def show
      @response = Ohmysupport::Ticket::Response.new
      @ticket = Ohmysupport::Ticket.find(params[:id])
    end

    private

    def ticket_params
      params.require(:ticket).permit(
        :name, :email, :title, :description, :category_id
      )
    end
  end
end
