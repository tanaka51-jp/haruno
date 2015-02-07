class GettingStartedForm
  include ActiveModel::Model

  attr_accessor :organization_name, :organization_login_name
  attr_accessor :user_family_name, :user_given_name, :user_email

  def save
    false
  end
end
