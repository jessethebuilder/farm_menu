FactoryGirl.define do
  factory :menu do
    name { Faker::Name.name }
  end
  
  factory :section do
    name { Faker::Name.name }
  end
  
  factory :product do
    name { Faker::Name.name }
  end
  
  factory :add_on do
    name { Faker::Name.name }
  end
end