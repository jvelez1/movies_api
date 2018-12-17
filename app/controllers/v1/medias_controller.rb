module V1
  class MediasController < ApplicationController
    def index
      @medias = Media.new
      render json: @medias, each_serializer: ::MediaSerializer
    end
  end
end
