class RemoveAvatarColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutorials, :avatar_file_name
    remove_column :tutorials, :avatar_content_type
    remove_column :tutorials, :avatar_file_size
    remove_column :tutorials, :avatar_updated_at
  end
end
