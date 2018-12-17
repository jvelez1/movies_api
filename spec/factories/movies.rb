FactoryGirl.define do
  factory :movie do
  end

  trait :iron_man do
    name 'Iron Man'
    plot 'Un robot bonito'
  end

  trait :star_war do
    name 'Star Wars'
    plot 'Es una serie de películas'
  end
end
