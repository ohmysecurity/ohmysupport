module Ohmysupport
  class Ticket < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
    # TODO: validate either email or author_id fields presence
    #validates :name, presence: true
    has_many :responses, class_name: 'Ticket::Response'
    belongs_to :author, class_name: Ohmysupport.user_model, foreign_key: 'author_id'
  end
end
