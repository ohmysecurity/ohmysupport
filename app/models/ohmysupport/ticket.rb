module Ohmysupport
  class Ticket < ApplicationRecord
    include AASM

    ON_USER_STATES = [:responded]
    ON_STAFF_STATES = [:pending, :waiting]

    validates :title, :description, :category_id, presence: true
    validates :email, :name, presence: true, unless: :author

    has_many :responses, class_name: 'Ticket::Response', dependent: :destroy
    belongs_to :author,
      class_name: Ohmysupport.user_model,
      foreign_key: 'author_id',
      optional: true

    aasm column: 'state' do
      state :pending, initial: true
      state :responded, :waiting, :closed

      event :respond do
        transitions from: [:pending, :waiting], to: :responded
      end

      event :wait do
        transitions from: :responded, to: :waiting
      end

      event :close do
        transitions from: :responded, to: :closed
      end
    end

    def owned_by?(user)
      author == user
    end

    def on_staff?
      ON_STAFF_STATES.include?(state.to_sym)
    end

    def on_user?
      ON_USER_STATES.include?(state.to_sym)
    end
  end
end
