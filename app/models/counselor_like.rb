class CounselorLike < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :counselor_id, :uniqueness => { :scope => [:want_id] }

  validates :counselor_id, :presence => true

  validates :want_id, :presence => true

end
