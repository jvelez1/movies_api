module QueryTypes
  MovieQueryType = GraphQL::ObjectType.define do
    name 'MovieQueryType'
    description 'The movie query type'

    field :movies, types[Types::MovieType], 'returns all movies' do
      resolve ->(_obj, _args, _ctx) { Movie.all }
    end

    field :movie, Types::MovieType, 'returns movie by id' do
      argument :id, !types.ID
      resolve ->(_obj, args, _ctx) { Movie.find_by(id: args[:id]) }
    end
  end
end
