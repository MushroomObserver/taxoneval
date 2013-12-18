# spec/factories/reports.rb
FactoryGirl.define do
  factory :report do |f|
    f.taxon { Faker::Name.last_name }
  end
end
