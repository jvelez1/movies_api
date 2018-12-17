module V1
  class SeasonsController < ApplicationController
    before_action :set_season, only: %i[show]

    def index
      @seasons = Season.order(:created_at).includes(:tv_show, :episodes)
      render json: @seasons, each_serializer: ::SeasonSerializer
    end

    def show
      render json: @season, serializer: ::SeasonSerializer
    end

    private

    def set_season
      @season = Season.find_by(id: params[:id])
      response_error_json_format(ErrorResponse.record_not_found(Season)) if @season.nil?
    end
  end
end
