class AddParkingidPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :parking_id, :integer
  end
end
