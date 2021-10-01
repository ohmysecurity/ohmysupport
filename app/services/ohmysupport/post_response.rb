module Ohmysupport
  class PostResponse
    def initialize(ticket, author)
      @ticket = ticket
      @author = author
    end

    def call(params)
      @ticket.responses.create(params_with_author(params))
    end

    private

    def params_with_author(params)
      params.merge(
        author_id: @author.id,
        author_type: @author.class.name
      )
    end
  end
end
