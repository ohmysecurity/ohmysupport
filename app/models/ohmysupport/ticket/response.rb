module Ohmysupport
  class Ticket::Response < ApplicationRecord
    validates :body, :author_id, :author_type, presence: true
    belongs_to :ticket

    # TODO: This is N+1, fix it
    def author
      author_type.constantize.find(author_id)
    end
  end
end
