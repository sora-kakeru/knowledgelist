class Want < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:wants] }

  validates :user_id, :presence => true

  validates :wants, :presence => true

end
