module Ohmysupport
  class Ticket::Category < ApplicationRecord
    validates :name, :presence: true, uniqueness: true
  end
end
