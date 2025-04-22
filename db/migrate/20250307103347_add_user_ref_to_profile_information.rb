class AddUserRefToProfileInformation < ActiveRecord::Migration[7.1]
  def change
    # Add the user_id reference without :unique
    add_reference :profile_informations, :user, foreign_key: true

    # Add a unique index on the user_id
    end
  
end

