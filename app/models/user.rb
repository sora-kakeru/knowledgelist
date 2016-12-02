class User < ApplicationRecord
  # Direct associations

  has_many   :counselor_likes,
             :foreign_key => "counselor_id",
             :dependent => :destroy

  has_many   :offers,
             :foreign_key => "counselor_id",
             :dependent => :destroy

  has_many   :wants,
             :dependent => :destroy

  # Indirect associations

  has_many   :sessions,
             :through => :offers,
             :source => :sessions

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
