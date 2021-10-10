module Ohmysupport
  class PostResponse
    def initialize(ticket, author)
      @ticket = ticket
      @author = author
    end

    def call(params)
      change_state
      @ticket.responses.create(params_with_author(params)).tap do |response|
        send_email_notification
      end
    end

    private

    def change_state
      if @author.class.name == Ohmysupport.user_model
        @ticket.wait! if @ticket.on_user?
      else
        # When admin posts response
        @ticket.respond! if @ticket.on_staff?
      end
    end

    def send_email_notification
      Ohmysupport::NewTicketResponseMailer
        .notify(@ticket.id)
        .deliver_later

    end

    def params_with_author(params)
      params.merge(
        author_id: @author.id,
        author_type: @author.class.name
      )
    end
  end
end
