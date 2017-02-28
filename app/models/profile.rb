class Profile < ApplicationRecord
  belongs_to :user

  # Validations
  validates :user, presence: true, uniqueness: {
    message: "Profile already exists"
  }
end
