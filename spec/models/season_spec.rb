require 'rails_helper'

RSpec.describe Season, type: :model do
  it 'season has to be valid' do
    tv_show = FactoryGirl.create(:tv_show)
    expect(FactoryGirl.build(:season, tv_show: tv_show)).to be_valid
  end
end
