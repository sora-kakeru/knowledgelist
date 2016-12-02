class WantTag < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :want

  # Indirect associations

  # Validations

  validates :want_id, :uniqueness => true

  validates :want_id, :presence => true

end
