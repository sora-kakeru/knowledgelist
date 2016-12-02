class Tag < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :tag, :uniqueness => true

  validates :tag, :presence => true

end
