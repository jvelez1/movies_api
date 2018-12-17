module V1
  class MoviesController < ApplicationController
    before_action :set_movie, only: %i[show]

    def index
      @movies = Movie.order(:created_at)
      render json: @movies
    end

    def show
      render json: @movie
    end

    private

    def set_movie
      @movie = Movie.find_by(id: params[:id])
      response_error_json_format(ErrorResponse.record_not_found(Movie)) if @movie.nil?
    end
  end
end
