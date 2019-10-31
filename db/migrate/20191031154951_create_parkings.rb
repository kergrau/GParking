class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :par_name
      t.string :par_address
      t.boolean :par_state
      t.string :par_latitude
      t.string :par_longitude

      t.timestamps
    end
  end
end
