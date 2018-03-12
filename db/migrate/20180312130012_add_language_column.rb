class AddLanguageColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :language, :string
  end
end
