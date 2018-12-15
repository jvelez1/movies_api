class CreateTvShow < ActiveRecord::Migration[5.1]
  def change
    create_table :tv_shows do |t|
      t.string :name, null: false
      t.text :plot, null: false
      t.timestamps
    end
  end
end
