class LibraryIsa < ApplicationRecord

  scope :active_by_date, ->(date) { where('expiry_date >= ?', date) }
  scope :order_by_expiry_date, -> { order('expiry_date DESC') }

  validates :expiry_date, presence: true
  validates :active, presence: true

  belongs_to :user
  belongs_to :library_isa, polymorphic: true
end
