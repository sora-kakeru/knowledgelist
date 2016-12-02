class Session < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :want_offer_id, :uniqueness => true

  validates :want_offer_id, :presence => true

end
