module V1
  class PurchasesController < ApplicationController
    before_action :set_user, only: %i[create]

    def create
      service = PurchaseService.new(params, @user)
      if service.create
        render json: service.object
      else
        response_error_json_format(service.error_response)
      end
    end

    def set_user
      @user = User.find_by(id: params[:user_id])
      response_error_json_format(ErrorResponse.record_not_found(User)) if @user.nil?
    end
  end
end
