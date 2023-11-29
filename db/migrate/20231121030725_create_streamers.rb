class CreateStreamers < ActiveRecord::Migration[5.2]
  def change
    create_table :streamers do |t|
      t.string :name, null: false
      t.string :x_url, null: false
      t.string :video, null: false

      t.timestamps
    end
  end
end
