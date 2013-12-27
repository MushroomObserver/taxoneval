# spec/factories/reports.rb
FactoryGirl.define do
  factory :report do
    name { Faker::Name.last_name }
  
    factory :family_report do
      name { 'Gomphidiaceae' }
    end
  end
end
