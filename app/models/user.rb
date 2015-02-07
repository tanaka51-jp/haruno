class User < ActiveRecord::Base
  belongs_to :organization

  validates :family_name, presence: true
  validates :given_name,  presence: true
  validates :email,       presence: true, uniqueness: { scope: :organization_id }
end
