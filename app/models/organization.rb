class Organization < ActiveRecord::Base
  has_many :users

  validates :name, presence: true, length: { maximum: 255 }
  validates :login_name,
    presence: true,
    length: { minimum: 3, maximum: 255, allow_blank: true },
    format: { with: /\A[a-zA-Z]([a-zA-Z0-9_\-])*\z/, allow_blank: true },
    uniqueness: true
end
