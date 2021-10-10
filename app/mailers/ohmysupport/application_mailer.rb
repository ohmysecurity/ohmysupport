module Ohmysupport
  class ApplicationMailer < ActionMailer::Base
    default from: Ohmysupport.mail_from_address
    layout 'mailer'
  end
end
