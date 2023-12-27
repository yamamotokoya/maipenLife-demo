class AddAvatarToStreamers < ActiveRecord::Migration[5.2]
  def change
    add_column :streamers, :avatar, :string
  end
end
