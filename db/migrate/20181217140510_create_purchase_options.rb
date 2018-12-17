class CreatePurchaseOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_options do |t|
      t.float :price, null: false, default: 0, precision: 16, scale: 2
      t.string :video_quality, null: false, default: 'HD'
      t.timestamps
    end
  end
end
