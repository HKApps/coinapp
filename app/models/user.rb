class User < ActiveRecord::Base
  acts_as_authentic

  has_many :schedules

  validates_presence_of :phone_number
  # validates :valid_phone_number

  # TODO add phone_number validation
  # def valid_phone_number
  # end
end
