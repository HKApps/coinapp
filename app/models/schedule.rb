class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :completed_actions

  validates_uniqueness_of :price
  validates_presence_of :price, :user_id, :comparison
  validates_numericality_of :price, greater_than: 0
  validates_inclusion_of :comparison, in: [">", "<"]

  scope :enabled, -> { where(enabled: true) }

  def self.greater(current_price)
    includes(:user).enabled.where(comparison: '>').where('? > price', current_price)
  end

  def self.lesser(current_price)
    includes(:user).enabled.where(comparison: '<').where('? < price', current_price)
  end

  def enabled!
    self.enabled = true
    self.save
  end

  def disabled!
    self.enabled = false
    self.save
  end

  def destroy
    run_callbacks :destroy do
      self.deleted_at = Time.now
      save!
    end
  end
end
