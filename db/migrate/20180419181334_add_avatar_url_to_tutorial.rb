class AddAvatarUrlToTutorial < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :avatar_url, :string
  end
end
