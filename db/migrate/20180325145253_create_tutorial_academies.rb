class CreateTutorialAcademies < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorial_academies do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :average_score
    end
  end
end
