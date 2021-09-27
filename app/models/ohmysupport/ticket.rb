module Ohmysupport
  class Ticket < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
    # TODO: validate either email or author_id fields presence
    #validates :name, presence: true
  end
end
