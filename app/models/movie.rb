class Movie < ApplicationRecord
  has_many :library_isas, as: :library_isa
  has_many :users, through: :library_isa
end
