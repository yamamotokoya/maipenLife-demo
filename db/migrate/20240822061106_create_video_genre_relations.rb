class CreateVideoGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :video_genre_relations do |t|
      t.references :video, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
