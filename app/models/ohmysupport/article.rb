module Ohmysupport
  class Article < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :author_id, presence: true
    validates :category_id, presence: true
  end
end
