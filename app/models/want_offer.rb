class WantOffer < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :want_id, :uniqueness => { :scope => [:offer_id] }

  validates :want_id, :presence => true

end
