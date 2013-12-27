# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taxon_datum do
    taxon nil
    report_type "MyString"
    key "MyString"
    value "MyString"
  end
end
