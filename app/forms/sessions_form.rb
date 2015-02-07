class SessionsForm
  include ActiveModel::Model

  attr_accessor :organization_login_name, :user_email, :user_password

  validates :organization_login_name, presence: true
  validates :user_email,    presence: true
  validates :user_password, presence: true
end
