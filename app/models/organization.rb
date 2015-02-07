class Organization < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :login_name,
    presence: true,
    length: { minimum: 3, maximum: 255 },
    format: { with: /\A[a-zA-Z]([a-zA-Z0-9_\-])*\z/ },
    uniqueness: true
end
