class AddColumnsToTutorials < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :suitability, :string
    add_column :tutorials, :type, :string
  end
end
