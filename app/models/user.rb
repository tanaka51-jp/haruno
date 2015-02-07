class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :organization

  validates :family_name, presence: true
  validates :given_name,  presence: true
  validates :email,       presence: true, uniqueness: { scope: :organization_id }, email: true
end
