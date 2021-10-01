require_dependency "ohmysupport/application_controller"

module Ohmysupport
  class ResponsesController < ApplicationController
    before_action :load_ticket, only: [:create]

    def create
      @response = Ohmysupport::PostResponse
        .new(@ticket, author)
        .call(response_params)

      if @response.valid?
        redirect_to ticket_path(@ticket), notice: 'Success'
      else
        flash[:alert] = 'Invalid form'
        render :new
      end
    end

    private

    def load_ticket
      @ticket = Ohmysupport::Ticket.find(params[:ticket_id])
    end

    def response_params
      params.require(:ticket_response).permit(
        :body
      )
    end

    def author
      current_user || current_staff
    end
  end
end
