require "ohmysupport/version"
require "ohmysupport/engine"
require 'redcarpet'

module Ohmysupport
  # TODO: probably we don't need this?
  mattr_accessor :current_user_method
  mattr_accessor :current_staff_method
  mattr_accessor :brand_name
  mattr_accessor :user_model
  mattr_accessor :staff_model
  mattr_accessor :mail_from_address

  def self.current_user
    send(@@current_user)
  end

  def self.user_model
    @@user_model
  end

  def self.staff_model
    @@staff_model
  end

  def self.mail_from_address
    @@mail_from_address
  end
end
