class AddProfileInformationRefToExperience < ActiveRecord::Migration[7.1]
  def change
    add_reference :experiences, :profile_information, null: false, foreign_key: true
  end
end
