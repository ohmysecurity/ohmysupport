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

    def article_badge_color(article)
      case article.state
      when 'enabled'
        'bg-success'
      when 'disabled'
        'bg-danger'
      end
    end
  end
end
