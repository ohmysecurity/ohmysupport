module Ohmysupport
  class Ticket < ApplicationRecord
    validates :title, :description, :category_id, presence: true
    validates :email, :name, presence: true, unless: :author

    has_many :responses, class_name: 'Ticket::Response'
    belongs_to :author,
      class_name: Ohmysupport.user_model,
      foreign_key: 'author_id',
      optional: true
  end
end
