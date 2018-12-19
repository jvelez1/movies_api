require 'rails_helper'

RSpec.describe Purchase, type: :request do
  before :each do
    @user = FactoryGirl.create(:user)
    @purchase_option = FactoryGirl.create(:purchase_option)
    @movie = FactoryGirl.create(:movie, :star_war)
    @params = { user_id: @user.id,
                purchase: { purchase_option_id: @purchase_option.id,
                            media_type_id: @movie.id,
                            media_type: @movie.class.name } }
  end

  it 'user does not exists' do
    post '/v1/user/999/purchases', params: @params, as: :json
    expect(response.status).to eq(404)
  end

  it 'create purshe using service' do
    post "/v1/user/#{@user.id}/purchases", params: @params, as: :json
    expect(response.status).to eq(200)
  end

  it 'failure in the creation by belonging' do
    @user.library_isas.create(library_isa: @movie, expiry_date: Date.today + 1.day)
    expect(@user.movies.first).to eq @movie
    post "/v1/user/#{@user.id}/purchases", params: @params, as: :json
    expect(response.status).to eq(422)
  end
end
