class OfferTag < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :offer_id, :presence => true

  validates :tag_id, :presence => true

end
