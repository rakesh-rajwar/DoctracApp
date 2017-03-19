class PowerOfAttorneySerializer < ActiveModel::Serializer
  attributes :name, :phone, :address, :state, :city, :zip_code, :email
end
