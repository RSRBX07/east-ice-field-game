FactoryGirl.define do

  factory :fruit do
    orchard

    trait :croped do
      croped_at {3.minutes.ago}
    end

    trait :red do
      color "red"
    end

    trait :blue do
      color "blue"
    end


  end

end