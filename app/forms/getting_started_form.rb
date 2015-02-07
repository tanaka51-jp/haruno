class GettingStartedForm
  include ActiveModel::Model

  attr_accessor :organization_name, :organization_login_name
  attr_accessor :user_family_name, :user_given_name, :user_email, :user_password, :user_password_confirmation

  attr_reader :organization, :user

  def initialize(attrs = {})
    super # assign instance variables

    @organization = Organization.new(
      name: organization_name,
      login_name: organization_login_name
    )

    @user = User.new(
      organization: organization,
      family_name:  user_family_name,
      given_name:   user_given_name,
      email:        user_email,
      password:     user_password,
      password_confirmation: user_password_confirmation
    )
  end

  def save
    valid? && @organization.save && @user.save
  end

  def valid?
    organization_valid = @organization.valid?
    user_valid = @user.valid?

    organization_valid && user_valid
  end
end
