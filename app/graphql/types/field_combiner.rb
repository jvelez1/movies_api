# GraphQL Ruby: Clean Up your Query Type
# https://m.alphasights.com/graphql-ruby-clean-up-your-query-type-d7ab05a47084
module Types
  class FieldCombiner
    def self.combine(query_types)
      Array(query_types).inject({}) do |acc, query_type|
        acc.merge!(query_type.fields)
      end
    end
  end
end
