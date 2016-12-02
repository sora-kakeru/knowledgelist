class CounselorLike < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :counselor_id, :presence => true

  validates :want_id, :presence => true

end
