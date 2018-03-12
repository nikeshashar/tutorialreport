class RenameTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutorials, :type, :type_of_tutorial
  end
end
