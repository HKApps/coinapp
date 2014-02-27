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
      only: :id,
      include: :schedules
    }).merge(opts)
  end

  def active_schedules
    self.schedules.select { |s| !s.deleted_at }
  end

  def enabled_schedules
    self.schedules.select { |s| !s.deleted_at && s.enabled == true }
  end

  def disabled_schedules
    self.schedules.select { |s| !s.deleted_at && s.enabled == false }
  end
end
