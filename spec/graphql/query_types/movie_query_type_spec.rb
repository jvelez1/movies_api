require 'rails_helper'

RSpec.describe QueryTypes::MovieQueryType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance
  # create fake todo lists using the todo_list factory
  movies = []
  movies << FactoryGirl.create(:movie, :iron_man)
  movies << FactoryGirl.create(:movie, :star_war)

  describe 'querying all todo lists' do
    it 'has a :movies that returns a Movie type' do
      expect(subject).to have_field(:movies).that_returns(types[Types::MovieType])
    end

    it 'returns all our created movies' do
      query_result = subject.fields['movies'].resolve(nil, nil, nil)

      # ensure that each of our todo lists is returned
      movies.each do |movie|
        expect(query_result.to_a).to include(movie)
      end

      # we can also check that the number of lists returned is the one we created.
      expect(query_result.count).to eq(movies.count)
    end
  end
end
