class AddProfileInformationRefToProject < ActiveRecord::Migration[7.1]
  def change
    add_reference :projects, :profile_information, null: false, foreign_key: true
  end
end
