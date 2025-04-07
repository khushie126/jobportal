class CreateProfileInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_informations do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :profile_image

      t.timestamps
    end
  end
end
