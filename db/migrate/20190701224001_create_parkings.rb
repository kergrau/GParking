class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :par_name, limit: 20
      t.string :par_address

      t.timestamps
    end
  end
end
