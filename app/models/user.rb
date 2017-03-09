class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one  :profile
  has_many :diseases
  has_many :images
  has_one  :avatar, -> { avatar }, class_name: Image.name
  has_one  :photo_id, -> { photo_id }, class_name: Image.name
end
