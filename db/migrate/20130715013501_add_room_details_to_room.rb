class AddRoomDetailsToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :answerer_sdp, :string
    add_column :rooms, :offerer_sdp, :string
  end
end
