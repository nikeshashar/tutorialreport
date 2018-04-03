class AddTutorialAcademyId < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_tutorials, :tutorial_academy_id, :integer
    add_index :sub_tutorials, :tutorial_academy_id
  end
end
