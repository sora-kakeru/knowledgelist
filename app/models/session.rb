class Session < ApplicationRecord
  # Direct associations

  belongs_to :want_offer

  # Indirect associations

  has_one    :offer,
             :through => :want_offer,
             :source => :offer

  has_one    :want,
             :through => :want_offer,
             :source => :want

  has_one    :user,
             :through => :offer,
             :source => :user

  # Validations

  validates :date_time, :presence => true

  validates :offer_stars, :presence => true

  validates :offer_stars, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

  validates :user_stars, :presence => true

  validates :user_stars, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

  validates :want_offer_id, :uniqueness => true

  validates :want_offer_id, :presence => true

end
