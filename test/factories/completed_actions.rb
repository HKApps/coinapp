# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :completed_action, :class => 'CompletedActions' do
    schedule_id "MyString"
    integer "MyString"
    price "9.99"
  end
end
