class RemoveVideoFromStreamers < ActiveRecord::Migration[5.2]
  def change
    remove_column :streamers, :video, :string
  end
end
