class EpisodeSerializer < ActiveModel::Serializer
  cache key: 'episode'
  attributes :title, :episode_number
end