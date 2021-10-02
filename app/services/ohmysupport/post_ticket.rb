module Ohmysupport
  class PostTicket
    def initialize(author)
      @author = author
    end

    def call(params)
      Ohmysupport::Ticket.create(params_with_author(params))
    end

    private

    def params_with_author(params)
      params.merge(author_id: @author.id)
    end
  end
end
