FactoryGirl.define do
  factory :episode do
    title 'Ritos iniciáticos'
    episode_number 1
    association :season
  end

  factory :episode2 do
    title 'Temporada2 e 1'
    episode_number 1
    association :season
  end
end
