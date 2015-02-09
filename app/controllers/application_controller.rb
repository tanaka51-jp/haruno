class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  before_action :set_organization, if: -> { logged_in? }

  private

  def set_organization
    @organization = current_user.organization
  end
end
