class ChangeAndAddColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutorials, :name, :title
    rename_column :tutorials, :average_score, :rating
  end
end
