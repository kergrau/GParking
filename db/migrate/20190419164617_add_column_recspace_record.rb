class AddColumnRecspaceRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :spaces_id, :string, :limit => 7
  end
end
