class AddLatLon < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :parking_id, :integer
  end
end
