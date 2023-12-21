class AddContentToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :content, :text
  end
end
