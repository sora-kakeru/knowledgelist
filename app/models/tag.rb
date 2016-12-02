class Tag < ApplicationRecord
  # Direct associations

  has_many   :wants_tags,
             :class_name => "WantTag",
             :dependent => :destroy

  has_many   :offers_tags,
             :class_name => "OfferTag",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :tag, :uniqueness => true

  validates :tag, :presence => true

end
