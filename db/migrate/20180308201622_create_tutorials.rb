class CreateTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorials do |t|
      t.string :name
      t.text :description
      t.string :link
      t.integer :average_score

      t.timestamps
    end
  end
end
