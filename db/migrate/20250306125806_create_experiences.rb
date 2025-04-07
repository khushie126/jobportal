class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.date :start_date
      t.date :end_date
      t.string :company_name
      t.text :description

      t.timestamps
    end
  end
end
