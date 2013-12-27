# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taxon do
    report
    name { Faker::Name.last_name }
    
    factory :family_taxon do
      report { family_report }
      name { 'Chroogomphus vinicolor' }
    end
  end
end
