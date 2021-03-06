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
      md = ::Redcarpet::Markdown.new(::Redcarpet::Render::HTML, markdown_options)
      md.render(text)
    end

    def markdown_options
      {
        hard_wrap: true,
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true
      }
    end
  end
end
