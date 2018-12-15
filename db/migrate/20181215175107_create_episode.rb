class CreateEpisode < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.belongs_to :season, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :episode_number, null: false
      t.timestamps
    end
  end
end
