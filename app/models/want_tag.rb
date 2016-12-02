class WantTag < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :want_id, :uniqueness => true

  validates :want_id, :presence => true

end
