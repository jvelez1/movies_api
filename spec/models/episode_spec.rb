require 'rails_helper'

RSpec.describe Episode, type: :model do
  it 'episode has to be valid' do
    tv_show = FactoryGirl.create(:tv_show)
    season = FactoryGirl.create(:season, tv_show: tv_show)
    expect(FactoryGirl.build(:episode, season: season)).to be_valid
  end
end
