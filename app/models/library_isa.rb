class LibraryIsa < ApplicationRecord
  validates :expiry_date, presence: true
  validates :active, presence: true

  belongs_to :user
  belongs_to :library_isa, polymorphic: true
end
