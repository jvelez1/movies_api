class SuccessResponse
  attr_accessor :title, :description, :status_code

  def initialize(args)
    @title = args[:title]
    @description = args[:description]
    @status_code = args[:status_code]
  end

  def to_json
    {
      message: title,
      success: true,
      description: description
    }
  end

  def self.successful_procedure(title = nil)
    new(
      title: title || 'Solicitud procesada con éxito',
      status_code: :ok
    )
  end

  def self.record_destroyed(record)
    new(
      title: "#{record.class.model_name.human} removido",
      description: "#{record.class.model_name.human} '#{record.has_attribute?(:name) ? record.name : record.id}' ha sido eliminado con éxito",
      status_code: :ok
    )
  end

  def self.records_destroyed(klass)
    new(
      title: "#{klass.model_name.human} removidos",
      description: "#{klass.model_name.human} han sido eliminado con éxito",
      status_code: :ok
    )
  end
end
