class Session < ApplicationRecord
  # Direct associations

  belongs_to :want_offer

  # Indirect associations

  # Validations

  validates :date_time, :presence => true

  validates :offer_stars, :presence => true

  validates :offer_stars, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

  validates :user_stars, :presence => true

  validates :user_stars, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

  validates :want_offer_id, :uniqueness => true

  validates :want_offer_id, :presence => true

end
