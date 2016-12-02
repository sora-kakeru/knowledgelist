class OfferTag < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :offer

  # Indirect associations

  # Validations

  validates :offer_id, :presence => true

  validates :tag_id, :presence => true

end
