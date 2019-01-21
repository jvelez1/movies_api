module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'Query'
    root_type.description = 'The query root'
    root_type.interfaces = []
    root_type.fields = root_type.fields = FieldCombiner.combine([
      QueryTypes::MovieQueryType
    ])
  end
end