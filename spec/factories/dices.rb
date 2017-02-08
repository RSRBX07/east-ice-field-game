FactoryGirl.define do

  factory :dice do

    trait :crow do
      showing_face :crow
    end

    trait :red do
      showing_face :red
    end

    trait :blue do
      showing_face :blue
    end


  end

end