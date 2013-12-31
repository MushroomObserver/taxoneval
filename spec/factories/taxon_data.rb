# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taxon_datum do
    taxon nil
    report_type "My Report Type"
    key "My Key"
    value "My Value"
  end
end
