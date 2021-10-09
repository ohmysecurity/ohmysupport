module Ohmysupport
  class Article < ApplicationRecord
    include AASM

    validates :title, presence: true
    validates :description, presence: true
    validates :author_id, presence: true
    validates :category_id, presence: true

    belongs_to :category

    aasm column: 'state' do
      state :disabled, initial: true
      state :enabled

      event :enable do
        transitions from: :disabled, to: :enabled
      end

      event :disable do
        transitions from: :enabled, to: :disabled
      end
    end
  end
end
