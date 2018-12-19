class ErrorResponse
  attr_accessor :title, :reasons, :description, :status_code

  def initialize(args)
    @title = args[:title]
    @status_code = args[:status_code]
    @reasons = args[:reasons] || {}
    @description = args[:description] || 'Un error ha ocurrido'
  end

  def to_json
    {
      error: {
        message: title,
        reasons: reasons,
        description: description
      }
    }
  end

  def self.record_not_found(klass)
    new(
      title: "#{klass.model_name.human} no encontrado",
      description: "#{I18n.t(klass.model_name.human, scope: 'error_response')} no existe",
      status_code: :not_found
    )
  end

  def self.record_not_saved(record, reasons = nil)
    new(
      title: 'Ups! Revisa los siguientes campos',
      description: "#{I18n.t(record.class.model_name.human, scope: 'error_response')} presenta valores incorrectos en sus atributos",
      reasons: reasons || record.errors.messages,
      status_code: :unprocessable_entity
    )
  end

  def self.record_not_destroyed(record, reasons = nil)
    new(
      title: 'Ups! No se pudo eliminar',
      description: 'No se pudo eliminar el registro',
      reasons: reasons || record.errors.messages,
      status_code: :unprocessable_entity
    )
  end

  def self.file_not_saved(file_name, record)
    new(
      title: 'Ups! el archivo no pudo guardarse',
      description: file_name,
      reasons: record.errors.messages,
      status_code: :unprocessable_entity
    )
  end

  def self.unknown_error(error)
    new(
      title: 'Un error desconocido ha ocurrido',
      reasons: { base: error.message },
      status_code: :error
    )
  end

  def self.not_found_error(error)
    new(
      title: 'Not found',
      reasons: { base: error.message },
      status_code: :not_found
    )
  end

  def self.bad_request(error = nil)
    new(
      title: 'Bad request',
      description: 'Revisa los parámetros y valores de la solicitud',
      reasons: error.is_a?(Hash) ? error : error.messages,
      status_code: :bad_request
    )
  end

  def self.unauthorized(message = nil)
    new(
      title: message || 'No está autorizado para realizar esta acción',
      description: 'El access token ha expirado o no tiene validez',
      status_code: :unauthorized
    )
  end

  def self.forbidden(message = nil)
    new(
      title: message || 'No está autorizado para realizar esta acción',
      description: 'El rol actual no le permite realizar esta acción',
      status_code: :forbidden
    )
  end

  def self.unprocessable_entity(error = nil)
    new(
      title: 'No se puede procesar la entidad',
      description: 'No se puede procesar la entidad',
      reasons: error.is_a?(Hash) ? error : error.messages,
      status_code: :unprocessable_entity
    )
  end
end
