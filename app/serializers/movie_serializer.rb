class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :plot, :created_at, :updated_at
end
