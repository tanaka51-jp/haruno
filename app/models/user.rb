class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :organization

  validates :family_name, presence: true
  validates :given_name,  presence: true
  validates :email,       presence: true, uniqueness: { scope: :organization_id }, email: true

  class << self
    # override sorcery default authentication method
    def authenticate(organization_login_name, email, password)
      org = Organization.find_by(login_name: organization_login_name)

      return unless org

      user = org.users.find_by(email: email)

      return unless user

      set_encryption_attributes

      return unless user.valid_password?(password)

      user
    end
  end
end
