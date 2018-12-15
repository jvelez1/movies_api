class Season < ApplicationRecord
  belongs_to :tv_show
  has_many :episodes
  accepts_nested_attributes_for :episodes
end
