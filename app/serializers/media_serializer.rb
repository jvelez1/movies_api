class MediaSerializer < ActiveModel::Serializer
  attributes :movies, :seasons

  def seasons
    object.attributes[:seasons].map { |season| SeasonSerializer.new(season) }
  end

  def movies
    object.attributes[:movies].map { |movie| MovieSerializer.new(movie) }
  end
end
