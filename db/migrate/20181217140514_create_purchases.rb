class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :purchase_option, foreign_key: true, null: false
      t.string :status, null: false, default: 'peding'
      t.float :amount, null: false, default: 0, precision: 16, scale: 2
      t.string :media_type, null: false, default: 'movie'
      t.integer :media_type_id, null: false

      t.timestamps
    end
  end
end
