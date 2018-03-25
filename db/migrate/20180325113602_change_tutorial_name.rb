class ChangeTutorialName < ActiveRecord::Migration[5.0]
  def change
    rename_table :tutorials, :sub_tutorials
  end
end
