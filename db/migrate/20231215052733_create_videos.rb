class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :video_url
      t.references :streamer, foreign_key: true

      t.timestamps
    end
  end
end
