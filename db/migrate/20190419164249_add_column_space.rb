class AddColumnSpace < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :sp_type, :string, :limit => 7
  end
end
