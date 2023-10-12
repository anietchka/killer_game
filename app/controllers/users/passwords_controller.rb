# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  respond_to :json
  include RackSessionsFix
  
  def update
    debugger
    super
  end
end
