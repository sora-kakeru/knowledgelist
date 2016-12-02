class Session < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_stars, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

  validates :want_offer_id, :uniqueness => true

  validates :want_offer_id, :presence => true

end
