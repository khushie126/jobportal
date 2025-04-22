class RemoveDuplicateUserIndexFromProfileInformations < ActiveRecord::Migration[7.1]
  def change
    def change
      remove_index :profile_informations, :user_id if index_exists?(:profile_informations, :user_id)
    end
  end
end
