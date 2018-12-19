module V1
  class LibrariesController < ApplicationController
    before_action :set_user, only: %i[index]

    def index
      @libraries = @user.library_isas
                        .active_by_date(Time.now)
                        .order_by_expiry_date
      render json: @libraries, each_serializer: ::LibrarySerializer
    end

    private

    def set_user
      @user = User.find_by(id: params[:user_id])
      response_error_json_format(ErrorResponse.record_not_found(User)) if @user.nil?
    end
  end
end
