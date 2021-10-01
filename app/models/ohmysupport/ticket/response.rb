module Ohmysupport
  class Ticket::Response < ApplicationRecord
    validates :body, presence: true
    # TODO: add relation to author
    belongs_to :ticket

    # TODO: This is N+1, fix it
    def author
      author_type.constantize.find(author_id)
    end
  end
end
