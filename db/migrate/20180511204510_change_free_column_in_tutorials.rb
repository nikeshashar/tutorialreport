class ChangeFreeColumnInTutorials < ActiveRecord::Migration[5.0]
  def change
    change_column :tutorials, :free?, :string
  end
end
