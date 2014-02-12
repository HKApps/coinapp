class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :completed_actions

  validates_presence_of :price, :user_id, :comparison, :enabled
  validates_numericality_of :price, greater_than: 0
  validates_inclusion_of :comparison, in: [">", "<"]

  default_scope { where(enabled: true) }
end
