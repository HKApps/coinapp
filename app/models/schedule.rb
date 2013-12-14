class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :completed_actions

  validates_presence_of :type, :price, :user_id, :comparison, :enabled
  validates_numericality_of :price, greater_than: 0
  validates_inclusion_of :type, in: ["notification", "buy_order", "sell_order"]
  validates_inclusion_of :comparison, in: [">", "<"]
end
