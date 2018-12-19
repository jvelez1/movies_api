class PurchaseService
  attr_accessor :object, :error_response

  MEDIA_TYPES = %w[Movie Season].freeze
  def initialize(params, user)
    @params = params
    @user = user
  end

  def create
    if valid_to_create?
      assign_attributes
      save_object
    else
      @error_response ||= ErrorResponse.record_not_saved(purchase_instance, 'No es posible crear el objecto, los parametros no son correctos')
    end
    @error_response.blank?
  end

  private

  def save_object
    if @object.valid?
      @object.status = create_library ? :success : :denaid
      @object.save
    end
    return unless @object.blank? || @object.try(:status) == :denaid
    @error_response ||= ErrorResponse.record_not_saved(purchase_instance, 'Ha ocurrido un error mientras se pagaba')
  end

  def purchase_params
    @params.require(:purchase).permit(:media_type,
                                      :media_type_id,
                                      :purchase_option_id)
  end

  def valid_to_create?
    return false unless MEDIA_TYPES.include?(purchase_params[:media_type].capitalize)
    valid_media_object? && valid_purchase_option? && valid_to_update?
  end

  def valid_media_object?
    @media_object = purchase_params[:media_type].capitalize.constantize.find_by(id: purchase_params[:media_type_id])
    @media_object.present?
  end

  def valid_purchase_option?
    purchase_option.present?
  end

  def in_library
    @in_library ||= @user.library_isas
                         .find_by(library_isa: @media_object)
  end

  def valid_to_update?
    return true unless in_library.present?
    return true if in_library.present? && in_library.expiry_date < Time.now
    @error_response ||= ErrorResponse.record_not_saved(purchase_instance, 'Ya tienes esta opción es tu lista')
    false
  end

  def create_library
    return update_library if in_library.present?
    @user.library_isas.create(library_isa: @media_object, expiry_date: Time.now + 2.days)
  end

  def update_library
    in_library.update(expiry_date: Time.now + 2.days)
  end

  def purchase_option
    @purchase_option ||= PurchaseOption.find_by(id: purchase_params[:purchase_option_id])
  end

  def assign_attributes
    @object = purchase_instance
    @object.assign_attributes(purchase_params)
    @object.amount = purchase_option.price
    @object.user_id = @user.id
  end

  def purchase_instance
    @purchase_instance ||= Purchase.new
  end
end
