FactoryGirl.define do
  factory :movie do
  end

  trait :iron_man do
    name 'Iron Man'
    plot 'Un robot bonito'
    year 2010
    directed_by 'Algun director'
    production_company 'Alguna Compania'
    country 'Algun Pais'
  end

  trait :star_war do
    name 'Star Wars'
    plot 'Es una serie de películas'
    year 2011
    directed_by 'Algun director2'
    production_company 'Alguna Compania2'
    country 'Algun Pais2'
  end
end
