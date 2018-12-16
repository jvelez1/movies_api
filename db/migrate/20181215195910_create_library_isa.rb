class CreateLibraryIsa < ActiveRecord::Migration[5.1]
  def change
    create_table :library_isas do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.references :library_isa, polymorphic: true
      t.boolean :active, default: true
      t.datetime :expiry_date, null: false
      t.timestamps
    end
  end
end
