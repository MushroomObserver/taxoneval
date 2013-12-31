# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taxon do
    report
    name { Faker::Name.last_name }
    eol_id { '0' }
    
    factory :family_taxon do
      report { family_report }
      name { 'Gomphidiaceae' }
      eol_id { '5955' }
    end
  end
end
