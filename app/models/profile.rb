class Profile < ApplicationRecord
  include Concerns::UserStatus
  belongs_to :user

  # Validations
  validates_presence_of :last_name, :first_name, :dob, :address, :gender, :state, :city, :zip_code, :cell_phone, :code_status

  after_create :change_user_status
end
