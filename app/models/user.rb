class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :phone_number
  end

  has_many :schedules

  validates_presence_of :phone_number
  # validates :valid_phone_number

  # TODO add phone_number validation
  # def valid_phone_number
  # end

  def as_json(opts={})
    super ({
      only: :phone_number,
      include: :schedules
    }).merge(opts)
  end
end
