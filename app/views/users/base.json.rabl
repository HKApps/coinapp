attributes :id, :phone_number

child :active_schedules => :schedules do
  attributes :id, :price, :comparison, :enabled, :updated_at
end
