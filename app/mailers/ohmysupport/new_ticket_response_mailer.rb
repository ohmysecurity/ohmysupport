module Ohmysupport
  class NewTicketResponseMailer < ApplicationMailer
    def notify(ticket_id)
      @ticket = Ohmysupport::Ticket.find(ticket_id)
      return unless @ticket.on_user?

      mail(to: @ticket.author_email, subject: 'New response to your ticket')
    end
  end
end
