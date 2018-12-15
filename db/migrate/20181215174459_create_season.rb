class CreateSeason < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.belongs_to :tv_show, foreign_key: true, null: false
      t.integer :season_number, null: false
      t.text :plot, null: false
      t.timestamps
    end
  end
end
