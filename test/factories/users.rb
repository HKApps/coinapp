# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    phone_number "MyString"
    password "MyString"
  end
end
