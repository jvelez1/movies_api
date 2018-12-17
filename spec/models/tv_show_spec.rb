require 'rails_helper'

RSpec.describe TvShow, type: :model do
  it 'tv_show has to be valid' do
    expect(FactoryGirl.build(:tv_show)).to be_valid
  end
end
