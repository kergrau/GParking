class DestroyParking < ActiveRecord::Migration[5.1]
  def change
    drop_table :parkings
  end
end
