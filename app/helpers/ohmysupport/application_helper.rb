module Ohmysupport
  module ApplicationHelper
    def current_year
      Time.now.year
    end

    def ticket_badge_color(ticket)
      case ticket.state
      when 'closed'
        'bg-dark'
      when 'pending'
        'bg-danger'
      when 'waiting'
        'bg-warning'
      when 'responded'
        'bg-primary'
      end
    end
  end
end
