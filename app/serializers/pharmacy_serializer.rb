class PharmacySerializer < ActiveModel::Serializer
  attributes :name, :phone, :address, :state, :city, :zip_code
end
