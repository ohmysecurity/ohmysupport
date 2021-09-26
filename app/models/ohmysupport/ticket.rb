module Ohmysupport
  class Ticket < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :name, presence: true
    # TODO: validate either email or author_id fields presence
  end
end
