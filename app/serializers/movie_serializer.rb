class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :plot, :year, :directed_by, :production_company,
             :country, :created_at, :updated_at
end
