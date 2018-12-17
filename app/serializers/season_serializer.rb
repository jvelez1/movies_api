class SeasonSerializer < ActiveModel::Serializer
  cache key: 'season'
  attributes :id, :season_number, :plot
  belongs_to :tv_show
  has_many :episodes, serializer: EpisodeSerializer do
    object.episodes.order(:episode_number)
  end
end
