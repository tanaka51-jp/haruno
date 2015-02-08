class WelcomeController < ApplicationController
  layout 'landing'

  skip_before_action :require_login

  def index
  end
end
