class EmergencyContact < ApplicationRecord
  include Concerns::UserStatus
  belongs_to :user

  # Validations
  validates_presence_of :name1, :phone1, :address1, :state1, :city1, :zip_code1

  after_create :change_user_status

end
