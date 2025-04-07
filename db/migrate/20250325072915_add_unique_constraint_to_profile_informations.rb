class AddUniqueConstraintToProfileInformations < ActiveRecord::Migration[7.1]
  def change
    unless index_exists?(:profile_informations, :user_id)
      add_index :profile_informations, :user_id, unique: true
    end
  end
end