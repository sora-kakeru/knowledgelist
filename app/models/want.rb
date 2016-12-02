class Want < ApplicationRecord
  # Direct associations

  has_many   :want_offers,
             :dependent => :destroy

  has_many   :wants_tags,
             :class_name => "WantTag",
             :dependent => :destroy

  has_many   :counselors_likes,
             :class_name => "CounselorLike",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :tags,
             :through => :wants_tags,
             :source => :tag

  # Validations

  validates :user_id, :uniqueness => { :scope => [:wants] }

  validates :user_id, :presence => true

  validates :wants, :presence => true

end
