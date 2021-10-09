module Ohmysupport
  class Category < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_many :articles
    has_many :tickets
  end
end
