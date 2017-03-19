FactoryGirl.define do
  factory :product do
    sequence(:name, 'a') { |sequence| sequence }
    description ''
    price 10.5
  end
end
