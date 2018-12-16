class User < ApplicationRecord
  has_many :library_isas

  with_options through: :library_isas, source: :library_isa do |library|
    library.has_many :movies, source_type: 'Movie'
    library.has_many :seasons, source_type: 'Season'
  end
end
