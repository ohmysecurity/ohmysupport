require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class TicketsController < ApplicationController
    before_action :any_signed_in?, except: [:new, :create]

    def index
      @tickets = Ohmysupport::Ticket.where(author_id: current_user.id)
    end

    def new
      @ticket = Ohmysupport::Ticket.new
    end

    def create
      @ticket = Ohmysupport::PostTicket
        .new(current_user)
        .call(ticket_params)

      if @ticket.valid?
        redirect_to ticket_path(@ticket), notice: 'Your ticket was submitted'
      else
        flash[:alert] = 'Invalid form'
        render :new
      end
    end

    def show
      @ticket = Ohmysupport::Ticket.find(params[:id])
      authorize_read(@ticket)
      @response = Ohmysupport::Ticket::Response.new
    end

    private

    def authorize_read(ticket)
      return if current_staff
      redirect_to root_path unless ticket.owned_by?(current_user)
    end

    def ticket_params
      params.require(:ticket).permit(
        :name, :email, :title, :description, :category_id
      )
    end
  end
end
