class Pharmacy < ApplicationRecord
	include Concerns::UserStatus
  belongs_to :user

  # Validations
  validates_presence_of :name, :phone, :address, :state, :city, :zip_code

  after_create :change_user_status

end
