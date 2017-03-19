class ProfileSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :middle_name, :dob, :gender, :address, 
        :state, :city, :zip_code, :cell_phone, :home_phone, :office_phone, :fax, :code_status
end
