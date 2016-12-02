class CounselorLike < ApplicationRecord
  # Direct associations

  belongs_to :want,
             :counter_cache => :counselors_likes_count

  belongs_to :counselor,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :counselor_id, :uniqueness => { :scope => [:want_id] }

  validates :counselor_id, :presence => true

  validates :want_id, :presence => true

end
