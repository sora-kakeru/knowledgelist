class Offer < ApplicationRecord
  # Direct associations

  has_many   :want_offers,
             :dependent => :destroy

  has_many   :offers_tags,
             :class_name => "OfferTag",
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "counselor_id"

  # Indirect associations

  has_many   :sessions,
             :through => :want_offers,
             :source => :session

  has_many   :tags,
             :through => :offers_tags,
             :source => :tag

  # Validations

  validates :counselor_id, :uniqueness => { :scope => [:offers] }

  validates :counselor_id, :presence => true

  validates :offers, :presence => true

end
