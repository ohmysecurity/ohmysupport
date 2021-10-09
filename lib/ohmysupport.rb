require "ohmysupport/version"
require "ohmysupport/engine"

module Ohmysupport
  # TODO: probably we don't need this?
  mattr_accessor :current_user_method
  mattr_accessor :current_staff_method
  mattr_accessor :brand_name
  mattr_accessor :user_model

  def self.current_user
    send(@@current_user)
  end

  def self.user_model
    @@user_model
  end
end
