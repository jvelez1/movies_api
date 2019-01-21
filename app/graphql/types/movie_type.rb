module Types
  # https://www.howtographql.com/graphql-ruby/0-introduction/
  # https://graphql.org/learn/

  # Tutorial
  # https://www.codementor.io/karanjaeddy/build-a-to-do-list-api-with-graphql-api-rails-5-part-1-irjt1e7jm
  MovieType = GraphQL::ObjectType.define do
    name 'MovieType'
    description 'The movie type'

    field :id, !types.ID
    field :name, !types.String
    field :plot, types.String
  end
end
