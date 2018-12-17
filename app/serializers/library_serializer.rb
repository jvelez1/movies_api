class LibrarySerializer < ActiveModel::Serializer
  cache key: 'library'
  attributes :library_isa_type, :library_isa_id, :library_isa, :expiry_date,
             :expiry_date_message, :created_at, :updated_at

  def expiry_date_message
    # Better use a decorator
    "Esta #{I18n.t(object.library_isa_type)} vence el #{object.expiry_date.strftime("%d/%m/%Y a las %I:%M%p")}"
  end
end
