class AddPicturesToTutorial < ActiveRecord::Migration[5.0]
  def change
    add_attachment :tutorials, :avatar
  end
end
