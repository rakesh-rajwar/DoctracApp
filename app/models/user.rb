class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one  :profile
  has_one  :emergency_contact
  has_one  :power_of_attorney
  has_one  :pharmacy
  has_one  :insurance
  has_and_belongs_to_many :diseases
  has_and_belongs_to_many :allergies
  has_many :images
  has_one  :avatar, -> { avatar }, class_name: Image.name
  has_one  :photo_id, -> { photo_id }, class_name: Image.name
end
