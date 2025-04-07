class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.belongs_to :profile_information
      t.timestamps
    end
  end
end
