class PriceHistory < ActiveRecord::Base
  validates_presence_of :price
  validates_numericality_of :price, greater_than: 0

  scope :second_to_last, -> { order('created_at DESC').offset(1).limit(1).first }
end
