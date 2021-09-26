module Ohmysupport
  class Article::Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
  end
end
