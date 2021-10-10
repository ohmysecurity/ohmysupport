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

    def markdown(text)
      text
      #options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
      #::Redcarpet::Markdown.new(text).to_html.html_safe
    end
  end
end
