class User < ActiveRecord::Base
  validates :family_name, presence: true
  validates :given_name,  presence: true
  validates :email,       presence: true
end
