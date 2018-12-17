FactoryGirl.define do
  factory :season do
    season_number 1
    plot 'Temporada 1'
    association :tv_show
  end

  trait :season2 do
    season_number 2
    plot 'Temporada 2'
  end
end
