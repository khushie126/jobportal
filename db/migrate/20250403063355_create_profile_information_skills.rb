class CreateProfileInformationSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_information_skills do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :profile_information, null: false, foreign_key: true

      t.timestamps
    end
  end
end
