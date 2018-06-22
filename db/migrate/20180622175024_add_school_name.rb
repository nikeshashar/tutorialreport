class AddSchoolName < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :school_name, :string
  end
end
