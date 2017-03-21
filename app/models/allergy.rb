class Allergy < ApplicationRecord
  has_and_belongs_to_many :users
  include PgSearch
  pg_search_scope :search_by_name, 
  				  :against => :name,
                  :using => {
                    :tsearch => {:prefix => true}
                  }
end
