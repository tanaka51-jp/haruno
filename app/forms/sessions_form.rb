class SessionsForm
  include ActiveModel::Model

  attr_accessor :organization_login_name, :user_email, :user_password

  def login
    false
  end
end
