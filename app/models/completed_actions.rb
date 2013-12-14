class CompletedActions < ActiveRecord::Base
  belongs_to :schedule

  validates_numericality_of :price, greater_than: 0
end
