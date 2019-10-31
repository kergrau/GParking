class AddLatLon < ActiveRecord::Migration[5.2]
  def change
    #add_column :parkings, :par_latitude, :string, limit: 15
    #add_column :parkings, :par_longitude, :string, limit: 15
    add_column :spaces, :parking_id, :integer
  end
end
