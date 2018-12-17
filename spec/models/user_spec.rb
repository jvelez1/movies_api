require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user has to be valid' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'has many movies through library_isa' do
    user = FactoryGirl.create(:user)
    movie1 = FactoryGirl.create(:movie, :star_war)
    movie2 = FactoryGirl.create(:movie, :iron_man)
    user.library_isas.create(library_isa: movie1, expiry_date: Date.today)
    user.library_isas.create(library_isa: movie2, expiry_date: Date.today)
    expect(user.movies.count).to eq 2
  end

  it 'has many seasons through library_isa' do
    tv_show = FactoryGirl.create(:tv_show)
    season1 = FactoryGirl.create(:season, tv_show: tv_show)
    season2 = FactoryGirl.create(:season, :season2, tv_show: tv_show)
    user = FactoryGirl.create(:user)
    user.library_isas.create(library_isa: season1, expiry_date: Date.today)
    user.library_isas.create(library_isa: season2, expiry_date: Date.today)
    expect(user.seasons.count).to eq 2
  end

  it 'has season and movies through library_isa' do
    user = FactoryGirl.create(:user)
    movie1 = FactoryGirl.create(:movie, :star_war)
    tv_show = FactoryGirl.create(:tv_show)
    season1 = FactoryGirl.create(:season, tv_show: tv_show)
    user.library_isas.create(library_isa: movie1, expiry_date: Date.today)
    user.library_isas.create(library_isa: season1, expiry_date: Date.today)
    expect(user.library_isas.count).to eq 2
    expect(user.movies.first).to eq movie1
    expect(user.seasons.first).to eq season1
  end
end
