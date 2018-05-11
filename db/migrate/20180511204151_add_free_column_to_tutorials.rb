class AddFreeColumnToTutorials < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :free?, :binary
  end
end
