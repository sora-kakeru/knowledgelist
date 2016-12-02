class Offer < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :counselor_id, :uniqueness => { :scope => [:offers] }

  validates :counselor_id, :presence => true

  validates :offers, :presence => true

end
