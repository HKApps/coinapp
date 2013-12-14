# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    user_id "MyString"
    type ""
    price "9.99"
    comparison "MyString"
    enabled false
  end
end
