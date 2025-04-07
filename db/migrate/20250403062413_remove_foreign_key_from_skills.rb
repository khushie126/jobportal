class RemoveForeignKeyFromSkills < ActiveRecord::Migration[7.1]
  def change
    remove_column :skills, :profile_information_id
  end
end
